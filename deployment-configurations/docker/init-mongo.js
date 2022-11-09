db.createUser(
    {
        user  : "cfcmedia",
        pwd   : "CFCiars1234",
        roles : [
            {
                role : "readWrite",
                db   : "media"
            }
        ]
    }
)