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
  "", ""
);

// Construct pipeline outside of serve for faster warm starts
const generateEmbedding = await pipeline(
  "feature-extraction",
  "Supabase/gte-small",
);

const pdfUrl = '';

// Deno Handler
serve(async (req) => {
  let { input } = await req.json();

  const decoder = new TextDecoder("utf-8");
  const dataaa = await Deno.readFile(pdfUrl);
  console.log(decoder.decode(dataaa));

  // Generate the embedding from the user input
  const output = await generateEmbedding(input, {
    pooling: "mean",
    normalize: true,
  });

  // Get the embedding output
  const embedding = Array.from(output.data);

  // Store the embedding
  const { data, error } = await supabase
    .from("documents")
    .insert({ id: 1, content: "XYZ", embedding })
    .select();

  if (error) {
    throw new Error(error.message);
  }

  // Return the embedding
  return new Response(
    JSON.stringify(data),
    { headers: { "Content-Type": "application/json" } },
  );
});


/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/embed' \
    --header 'Authorization: Bearer ' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
