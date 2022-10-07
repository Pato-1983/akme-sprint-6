function adminMiddleware(req, res, next) {
    if(res.locals.userLogged && res.locals.userLogged.admin == true) {
        next();
    }

    res.redirect("/");
}

module.exports = adminMiddleware;