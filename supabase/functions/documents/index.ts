// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import {
  env,
  pipeline,
} from "https://cdn.jsdelivr.net/npm/@xenova/transformers@2.5.0";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.39.3";

// Preparation for Deno runtime
env.useBrowserCache = false;
env.allowLocalModels = false;

const supabase = createClient(
  "https://lwyobyydvdriwaukdbjf.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx3eW9ieXlkdmRyaXdhdWtkYmpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU0ODMzMjYsImV4cCI6MjAyMTA1OTMyNn0.Awi7QbNh9gHf0ahIvl2vge5SphKbzXc4WpcxtYtZssY",
);

// Construct pipeline outside of serve for faster warm starts
const generateEmbedding = await pipeline(
  "feature-extraction",
  "Supabase/gte-small",
);

serve(async (req) => {
  const { input } = await req.json();

  // Generate the embedding from the user input
  const output = await generateEmbedding(input, {
    pooling: "mean",
    normalize: true,
  });

  // Get the embedding output
  const embedding = Array.from(output.data);

  const { data: documents, error } = await supabase.rpc("match_documents", {
    query_embedding: embedding, // Pass the embedding you want to compare
    match_threshold: 0.78, // Choose an appropriate threshold for your data
    match_count: 10, // Choose the number of matches
  });
  if (error) {
    throw new Error(error.message);
  }

  console.log(documents);

  return new Response(
    JSON.stringify(documents),
    { headers: { "Content-Type": "application/json" } },
  );
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/documents' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
