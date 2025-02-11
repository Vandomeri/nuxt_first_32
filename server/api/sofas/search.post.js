import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    const prisma = new PrismaClient()

    const resp = await prisma.sofas.findMany({
        where: {
            title: {
                contains: body.query
            }
        }
    })

    return resp

})
