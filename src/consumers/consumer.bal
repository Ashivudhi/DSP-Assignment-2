//CONSUMER
import ballerina/io;
import ballerina/kafka;
import ballerina/log;
import ballerina/lang;

kafka:ConsumerConfig consumerConfigs{
    bootstrapServers: "localhost:9092"
    groupId: "voters",
    pollingIntervalMills: 1000,
    keyDeserializerType: kafka:DES_INT,
    valueDeserializerType: kafka:DES_STRING,
    autoCommit: false

}

schema {
  query: Query
  mutation: Mutation
}

type Candidate{
    CandidateId: int,
    name: string,
    gender: string
}

type Voter {
  voterid: int!
  name: string!
  gender: string
}
type fraudelets {
  voter: [Voter]
}


type Query {
  voterID(id: ID!): Voter
  name(string: ID!): Name
  gender: [Gender]
}

type Mutation {
  addVoters(voterID: int, name: string!, gender: [Gender]): Voter
  viewVoter(voterID: int, name: string!, gender: [Gender]): Voter
}type Mutation {
  displayCandidate(voterID: int, name: string!, gender: [Gender]): Voter
}

listener kafka:Consumer consumer = new (consumerConfigs);
service kafkaService on consumer {
     resource function viewVoters(kafka:Consumer kafkaConsumer, kafka:ConsumerRecord[] records) {

         foreach var kafkaRecord in records{
             processKafkaRecord(kafkaRecord);
         }

         var commitResult = kafkaConsumer->commit();
         if(commitResult is error) {
             log: printError("Error!", commitResult);
         }
     }
 }
 function addVoters(kafka:ConsumerRecord kafkaRecord){


     foreach var entry in records {
         byte[] message =kafkaRecord.value;
         if(message1 is string){
            byte[] serializedMsg = entry.value;
            // Convert the serialized mes sage to string message
            string msg = encoding:byteArrayToString(serializedMsg);
            io:println("New message received from the product admin");
            // log the retrieved Kafka record
            io:println("//");
            // Update the database with the new price for the specified product
            io:println("Database updated with the new voter data");
        }
        else{
         log:printErrror("Error", message1);
     }

 }
 }resource function candidates(kafka:Consumer kafkaConsumer, kafka:ConsumerRecord[] records) {

           foreach var kafkaRecord in records{
               processKafkaRecord(kafkaRecord);
           }

           var commitResult = kafkaConsumer->commit();
           if(commitResult is error) {
               log: printError("Error!", commitResult);
           }
       }
