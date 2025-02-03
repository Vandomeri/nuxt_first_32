import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    const prisma = new PrismaClient()

    const resp = await prisma.users.create({
        data: {
            email: body.email,
            fio: body.fio,
            password: body.password
        }
    })

    return {
    }

})
