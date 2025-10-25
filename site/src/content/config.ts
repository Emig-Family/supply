import { glob } from "astro/loaders";
import { defineCollection, z } from "astro:content";

export const collections = {
  inventory: defineCollection({
    loader: glob({ pattern: "*.yaml", base: "src/content/inventory/" }),
    schema: z.object({
      title: z.string(),
      description: z.string(),
      images: z.array(z.string()),
      category: z.string().optional(),
      availability: z.string().optional(),
      order: z.number().optional(),
      manualUrl: z.string().optional(),
    }),
  }),
};
