
import ballerina/io;
import ballerinax/kafka;
kafka:ProducerConfiguration producerConfiguration = {
    bootstrapServers: "localhost:9092",

    clientId: "basic-producer",
    acks: "all",
    retryCount: 3,
    valueSerializerType: kafka:SER_BYTE_ARRAY
};
kafka:Producer kafkaProducer = new (producerConfiguration);
public function main() {
    string message = "Hello World, Ballerina";
    var sendResult = kafkaProducer->send(message.toBytes(), "test-kafka-topic");

    if (sendResult is error) {
        io:println("Error occurred while sending data: " +
                    sendResult.toString());
    } else {
        io:println("Message sent successfully.");
    }
    var flushResult = kafkaProducer->flushRecords();

    if (flushResult is error) {
        io:println("Error occurred while flushing the data: " +
                    flushResult.toString());
    } else {
        io:println("Records were flushed successfully.");
    }
}