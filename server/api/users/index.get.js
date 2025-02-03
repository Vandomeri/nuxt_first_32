import { PrismaClient } from "@prisma/client"

export default defineEventHandler(async (event) => {


    const prisma = new PrismaClient()

    const resp = await prisma.users.findMany()

    // SELECT * FROM `users` WHERE age < 30

    return resp

})