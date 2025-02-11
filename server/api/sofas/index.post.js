import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    const prisma = new PrismaClient()

    const resp = await prisma.sofas.create({
        data: {
            title: body.title,
            price: Number(body.price),
            material: body.material,
            sofas_colorsId: Number(body.color)
        }
    })

    return resp

})
