function guestMiddleware(req,res,next) {

    if (req.session.userLogged) {
        return res.redirect('/users/Profile')
    }
    
    next()

}

module.exports = guestMiddleware