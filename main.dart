import 'dart:io';

 void main() {
  var travel = Travel();
  void choosen() {
    print('choose from 1 to 6');
    print('1 to add trip');
    print('2 to edit trip');
    print('3 to delete  trip');
    print('4 to view trip');
    print('5 to search trip');
    print('6 to reverse trip');
    var number = int.parse(stdin.readLineSync());
    if (number == 1 || number == 2 || number == 3 || number == 4 || number == 5 || number == 6) {
      switch (number) {
        case 1:
          travel.addTrip();
          break;
        case 2:
          travel.editTrip();
          break;
        case 3:
          travel.deleteTrip();
          break;
        case 4:
          travel.viewTrips();
          break;
        case 5:
          travel.searchTrip();
          break;
        case 6:
          travel.reservetrip();
          break;
        default:
          print('please input a valid number');
      }
      choosen();
    } else {
      print('Done');
    }
    ;
  }

  choosen();
}

class Travel {
  int limit_passenger;
  String location, id;
  double price;
  DateTime date;
  Map<String, List> trips = {};
  List addtrip = [];

  addTrip() {
    print('enter your id ');
    id = stdin.readLineSync();
    print('enter limit_passenger');
    limit_passenger = int.parse(stdin.readLineSync());
    print('enter price');
    price = double.parse(stdin.readLineSync());
    print('enter date');
    date = DateTime.parse(stdin.readLineSync());
    print('enter your location');
    location = stdin.readLineSync();
    addtrip.add({
      'id': id,
      'location': location,
      'passengerLimit': limit_passenger,
      'date': date,
      'price': price,
    });
    print(addtrip);
  }

  editTrip() {
    print("enter trip's id");
    var search_id = stdin.readLineSync();
    for (Map x in addtrip) {
      if (search_id == x['id']) {
        print('choose from 1 to 4');
        print('1 : change data');
        print('2 : change Location');
        print('3 : change limitpassenger');
        print('4 : change price');

        var number = int.parse(stdin.readLineSync());
        switch (number) {
          case 1:
            print('enter new data ');
            var newdata = stdin.readLineSync();
            x['data'] = newdata;
            print('new trip info is :  $addtrip');
            break;
          case 2:
            print('enter new location');
            var newlocation = stdin.readLineSync();
            x['location'] = newlocation;

            print('new trip info is :  $addtrip');
            break;
          case 3:
            print('enter new passenger limit');
            var newlimit = int.parse(stdin.readLineSync());
            x['passengerLimit'] = newlimit;
            print('new trip info is :  $addtrip');
            break;
          case 4:
            print('enter new price');
            var newprice = double.parse(stdin.readLineSync());
            x['price'] = newprice;
            print('new trip info is :  $addtrip');
            break;

          default:
            print('enter a valid number');
        }
      }
    }
  }

  deleteTrip() {
    print('enter trip id ');
    var deltrip = stdin.readLineSync();
    for (Map x in addtrip) {
      if (deltrip == x['id']) {
        addtrip.remove(addtrip.indexOf(x));
        print(addtrip);
        break;
      } else if (deltrip != x['id']) {
        print('enter valid id');
      }
    }
  }

  viewTrips() {
    print('The trips orderd by date :');
    var orderdList = List.from(addtrip);
    orderdList.sort((first, last) {
      var firstDate = first['date'];
      var lastDate = last['date'];
      return firstDate.compareTo(lastDate);
    });
    orderdList.forEach((trip) {
      print('the trip id is : ${trip['id']}');
      print('the trip location is : ${trip['location']}');
      print('the trip Passenger Limit is : ${trip['passengerLimit']}');
      print('the trip date is : ${trip['date']}');
      print('the trip price is : ${trip['price']}');
      print('');
    });
  }

  searchTrip() {
    print('enter trip price ...please');
    var pricesearch = stdin.readLineSync();
    for (var x in addtrip) {
      if (x['price'] == pricesearch) {
        print(' trip Location :${x['location']}');
        print(' trip price :${x['price']}');
        print(' trip date :${x['date']}');
        print(' trip passenger Limit :${x['passengerLimit']}');
        break;
      } else if (x['price'] != pricesearch) {
        print('sorry   not found trip by this price');
      }
    }
  }

  reservetrip() {
    print('here is the available trips:\n');
    for (var trip in addtrip) {
      var tripIndex = addtrip.indexOf(trip);
      print('trip number ${tripIndex + 1} :\n');
      print('the trip Location :${trip['location']}');
      print('the trip price :${trip['price']}');
      print('the trip date :${trip['date']}');
      print('the trip passenger Limit :${trip['passengerLimit']}\n');
    }
    print('please enter trip number you want to reserve :');
    var inputNumber = int.parse(stdin.readLineSync());
    for (var trip in addtrip) {
      var tripIndex = addtrip.indexOf(trip);
      if (inputNumber == tripIndex + 1) {
        print(trip);
        print('please enter your name:');
        var coustmerName = stdin.readLineSync();
        if (trips[trip['id']] == null) {
          trips[trip['id']] = [];
        }
        if (trip['passengerLimit'] > trips[trip['id']].length) {
          trips[trip['id']].add(coustmerName);
          print(
              'trip reserved successfully and the remaining seats are : ${trip['passengerLimit'] - trips[trip['id']].length}');
        } else {
          print('sorry... the trip is full!');
        }
        break;
      }
    }
  }
}