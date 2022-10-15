const jsonDB = require('../model/jsonDatabase');
const usersModel = jsonDB ('users')
let db = require("../dataBase/models")

async function userLoggedMiddleware (req,res,next) {

    res.locals.isLogged = false

    const emailInCookie = req.cookies.email
    const UserFromCookie = await db.Users.findOne ({
        where: {
            email: emailInCookie || " "
        }
    })

    if (UserFromCookie) {
        req.session.userLogged = UserFromCookie
    }        

    if (req.session && req.session.userLogged) {
        res.locals.isLogged = true;
        res.locals.userLogged = req.session.userLogged;
    }
    
    

    next()

}

module.exports = userLoggedMiddleware