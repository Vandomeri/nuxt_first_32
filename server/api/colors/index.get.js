import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const prisma = new PrismaClient()

    const resp = await prisma.sofas_colors.findMany()

    return resp
})