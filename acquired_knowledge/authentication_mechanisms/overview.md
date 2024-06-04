**Authentication** is required to verify the identity of a user or a system that wants to access a web app.

Methods for achieving authentication:

* Cookies-Based Authentication
* Authentication Using Tokens
* Third-party access (OAuth, API token)
* OpenID
* SAML

*Cookie- or token-based authentication is best for web-based applications. API-token authentication is better than cookie-based authentication to support both web and mobile.*

1. **Cookies-Based Authentication**

![Image](./cookies-based%20authentication.png)

Advantages:

 - cookies use very little space
 - cookies are simple to use and apply
 - ability to revoke their validity

Disadvantages:

 - cookies are vulnerable to XSS and CSRF attacks
 - scaling becomes a problem when many users log in
 - contains sensitive information about the user
 - takes space in the database for storing session id

Best Practices:

- To avoid brute force assaults, the session ID should be long (128 bits) and generated randomly. The session ID should be free of any sensitive information pertaining to the user.
- Further, the information should consist of a meaningless string of random characters. All session-based applications should use HTTPS communication.
- Keep sessions under control by deleting them when the browser is closed, a timeout occurs, the user logs out, or they log in from a different site.

2. **Authentication Using Tokens**

JSON Web Tokens (JWTs) are the most widely used web app authentication method.
