const faker = require("faker");
const fs = require("fs");
const path = require("path");
const categories = `
Asian Fusion,
Bagels,
Bakery,
Bar / Lounge / Pub,
Barbeque,
Breakfast,
British,
Brunch,
Buffets,
Burgers,
Cajun/Creole,
Caribbean,
Chinese,
Coffee / Espresso,
Country Food,
Cuban,
Deli,
Doughnuts,
Family Fare,
Fast Food,
Fine Dining,
Food Trucks,
French,
German,
Gluten-free,
Greek,
Happy Hour,
Hot Dogs,
Ice Cream,
Indian,
Irish,
Italian,
Japanese,
Latin American,
Live Entertainment,
Mediterranean,
Mexican,
Pancakes/Waffles,
Pizza,
Polish,
Sandwiches,
Seafood,
Soul Food,
Soup & Salad,
Southern,
Spanish,
Sports Bar,
Steaks,
Sushi,
Tapas,Thai,Vegan Friendly,Vegetarian,Waterfront
`.split(",");
/**
 * 
 * String title;
    String description;
    String leadImage;
    String announcement;
    String category;
    String address;
    int averagePrice;
    int discount;
    bool saved;
    Map<String, dynamic> openingTimes;
    List<String> tags, images;
 */

function createMulitple(num, val)  {
  return [...Array(num).keys()].map((x) => val());
};
const _pick  = (arr,num = 1) =>{
    const __pick = () => arr[~~Math.random() * arr.length];
    return [...Array(num).keys()].map(()=>__pick())
}
const _createAnnouncement = () => {
  return {
    active: faker.datatype.boolean(),
    start_date: faker.date.recent(),
    end_date: faker.date.recent(),
  };
};
const createResturant = () => {
  return {
    address: faker.address.streetAddress(),
    id: faker.datatype.uuid(),
    description: faker.lorem.paragraph(),
    discount:~~(Math.random() * 10),
    average_price:~~(Math.random() * 40),
    categories:_pick(categories),
    saved:faker.datatype.boolean(),
    operating_hours:{},
    images:[],
    tags:_pick(categories,10),
    announcements: [],
  };
};

const RESTURANTS = createMulitple(20, createResturant);
const RESTURANT_IDS = [...RESTURANTS].map((x) => x.id);
module.exports = () => {
    return {
        resturants:RESTURANTS
    }
  }