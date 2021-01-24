import ballerina/http;
import ballerina/graphql;

http:Listener httpListener = new(9099);

service graphql:Service /graphql on new graphql:Listener(httpListener) {

    resource function get profile(int id) returns Person {

        return candidates[id];
    }
}
public type Person record {
    string name;
    int age;
    Address address;
};
public type Address record {
    string number;
    string street;
    string city;
};

Person p1 = {
    name: "Sherlock Holmes",
    age: 40,
    address: {
        number: "221/B",
        street: "Baker Street",
        city: "London"
    }
};
Person p2 = {
    name: "Walter White",
    age: 50,
    address: {
        number: "308",
        street: "Negra Arroyo Lane",
        city: "Albuquerque"
    }
};
Person p3 = {
    name: "Tom Marvolo Riddle",
    age: 100,
    address: {
        number: "Uknown",
        street: "Unknown",
        city: "Hogwarts"
    }
};
Person[] candidates = [p1, p2, p3];