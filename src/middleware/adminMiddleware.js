function adminMiddleware(req, res, next) {
    if(res.locals.userLogged && res.locals.userLogged.roles_id == 1) {
        next();
    }

}

module.exports = adminMiddleware;