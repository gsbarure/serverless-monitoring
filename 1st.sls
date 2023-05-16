org: gajananbarure
app: serverless-taskmaster-aws-app
service: serverless-taskmaster-app

provider:
   name: aws
   region: us-east-1
   runtime: nodejs14.x
   iamRoleStatements:
     - Effect: Allow
       Action:
         - dynamodb:*
       Resource:
         -arn:aws:dynamodb:us-east-1:310133246623:table/KaamKaro

functions:
  hello:
    handler: src/hello.handler
    events:
      - httpApi:
          path: /hello
          method: get
  kaamBharo:
    handler: src/kaamBharo.handler
    events:
      - httpApi:
          path: /kaam
          method: post
  kaamDikhao:
    handler: src/kaamDikhao.handler
    events:
      - httpApi:
          path: /kaam
          method: get
  kaamKhatamKaro:
    handler: src/kaamKhatamKaro.handler
    events:
      - httpApi:
          path: /kaam/{id}
          method: put

resources:
  Resources:
    KaamKaro:
      Type: AWS::DynamoDB::Table
      Properties:
        TableName: KaamKaro
        BillingMode: PAY_PER_REQUEST
    
        AttributeDefinitions:
          - AttributeName: id
            AttributeType: S
        KeySchema:
          - AttributeName: id
            KeyType: HASH
