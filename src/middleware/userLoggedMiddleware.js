const jsonDB = require('../model/jsonDatabase');
const usersModel = jsonDB ('users')

function userLoggedMiddleware (req,res,next) {

    res.locals.isLogged = false;

    let emailInCookie = req.cookies.email
    let UserFromCookie = usersModel.findByField ("email", emailInCookie)

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