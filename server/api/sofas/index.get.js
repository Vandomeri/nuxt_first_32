import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const query = getQuery(event)
    console.log(query)
    const prisma = new PrismaClient()



    const resp = await prisma.sofas.findMany({
        where: {
            sofas_colorsId: {
                ...(query.colors ? { in: query.colors.split('-').map(el => Number(el)) } : {})
            },
            price: {
                ...(query.min ? { gte: Number(query.min) } : {}),
                ...(query.max ? { lte: Number(query.max) } : {}),

            }
        },
        include: {
            sofas_colors: true
        }
    })


    return resp

})