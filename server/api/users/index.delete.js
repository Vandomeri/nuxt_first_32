import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    const prisma = new PrismaClient()

    const resp = await prisma.users.delete({
        where: {
            id: Number(body.userId)
        }
    })

    console.log(resp)

    return resp

})