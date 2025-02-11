import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    const prisma = new PrismaClient()

    const resp = await prisma.sofas_colors.create({
        data: {
            name: body.name,
            hex_color: body.hexColor
        }
    })

    return resp
})
