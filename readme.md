### chat app made using hasura.io and plain JS react
##first go into hasura and do a docker-compose up -d

##then, go into chat-migrations and install hasura-cli
https://hasura.io/docs/1.0/graphql/core/hasura-cli/index.html#installation

then do 

# hasura migrate apply
# hasura metadata apply.
also insert two users in the user table. name doesn't matter.


i assume you already know how to start the react app, npm i, npm run start, yada yada