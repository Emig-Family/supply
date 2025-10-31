import { defineCollection, z } from 'astro:content'

// Content collections are retained for editing and export but are no longer
// used at runtime when fetching data from D1.
export const collections = {
  inventory: defineCollection({
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
}
