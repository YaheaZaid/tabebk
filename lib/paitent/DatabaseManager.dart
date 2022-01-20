import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseManager {
  Future<bool> addNewHospital(
      String name,int number,List date,List sec) async {
    
    var profileDoctor =
    Firestore.instance.collection('Doctor').document(number.toString());
    // DocumentReference Section = await Firestore.instance.collection('Doctor').document(number.toString()).collection('section');
    // DocumentReference Date = await Firestore.instance.collection('Doctor').document(number.toString()).collection('Date');

    final int documents = number;
   await profileDoctor
        .setData({'hospital': name, 'password': number});
    CollectionReference profilesec =
    Firestore.instance.collection('Doctor').document(number.toString()).collection("section");
    for (int i=0 ;i < sec.length;i++) {
     for (int j=0 ;j < date.length;j++) {

       profilesec.document(sec[i]).setData({'${sec[i]}': date[j]});

     }
     
   }
   return true;
  }
  Future<void> createUserData( int Docid,int Paitid,
      String hospitalname, String date, String section) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Paitent').document(Paitid.toString()).collection("Schedule");
    return await profileList
        .document(Docid.toString())
        .setData({'Hospital': hospitalname,'Paitid':Paitid,'Docid':Docid, 'date': date, 'section': section});
  }
  Future<void> askNewHos(
      String number,String email, String name) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Support').document('12345678910').collection('Waiting');
    final String documents = number;
    return await profileList
        .document(documents.toString())
        .setData({'number': number,'name': name,'email':email});

  }
  Future<void> askDate(
  int Docid,int Paitid, String name,int number,  String section,String date,String note,bool accept) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Doctor').document(Docid.toString()).collection('Waiting');
    final QuerySnapshot qSnap = await Firestore.instance.collection('Doctor').document(Paitid.toString()).collection('Waiting').getDocuments();
    final int documents = Paitid;
    return await profileList
        .document(documents.toString())
        .setData({'id': Paitid,'name': name, 'date': date,'note': note, 'section': section,'accept':accept});

}
  Future<void> addSSupport(
      int id, String email,String number) async {
    final CollectionReference profileSupport =
    Firestore.instance.collection('Support').document(id.toString()).collection('Team');

    return await profileSupport
        .document(number)
        .setData({'email': email, 'number': number});
  }
  Future<void> addPaitNotifcation(
      int Docid,int Paitid, String name,String result,  String section,String date,String Hosptal) async {
    final CollectionReference profileDoctor =
    Firestore.instance.collection('Paitent').document(Paitid.toString()).collection('Notifcation');
    final int documents = Paitid;
    return await profileDoctor
        .document(documents.toString())
        .setData({'name': Paitid, 'date': date,'Hosptal': Hosptal, 'section': section,'result':result});
  }
  Future<void> addHosNotifcation(
      int Docid,int Paitid,String result,  String section,String date,String Hosptal) async {
    final CollectionReference profileDoctor =
    Firestore.instance.collection('Doctor').document(Docid.toString()).collection('Notifcation');
    final int documents = Docid;
    return await profileDoctor
        .document(documents.toString())
        .setData({'name': Docid, 'date': date,'number': Docid, 'section': section,'result':result});
  }

  Future<void> addShedule(
      int Docid,int Paitid, String name,int number,  String section,String date,String Hosptal) async {
    final CollectionReference profileDoctor =
    Firestore.instance.collection('Doctor').document(Docid.toString()).collection('Schedule');
    final QuerySnapshot qSnap = await Firestore.instance.collection('Doctor').document(Paitid.toString()).collection('Schedule').getDocuments();
    final int documents = Paitid;
    createUserData(Docid, Paitid, Hosptal, date, section);
    return await profileDoctor
        .document(documents.toString())
        .setData({'name': Paitid, 'date': date,'Hosptal': Hosptal, 'section': section, 'number': Docid});
  }
  Future<void> addMedicines(int Paitid, String name ,String Hosptal ,String note) async {
    final CollectionReference profileDoctor =
    Firestore.instance.collection('Paitent').document(Paitid.toString()).collection('Medicines');
    final int documents = Paitid;
    return await profileDoctor
        .document(documents.toString())
        .setData({'name': name,'Hosptal': Hosptal, 'note': note});
  }

  Future<void> emergencyCall(
  String id,String name,String num, double longitude, double latitude,String call,String note) async {
    final CollectionReference profileEmergency =
    Firestore.instance.collection('Emergency').document("555555").collection('Schedule');

    return await profileEmergency
        .document(id)
        .setData({'name': name,'number': num, 'longitude': longitude,'latitude': latitude,"call":call,"note":note});
  }
  Future updateUserList(String name, String gender, int score, String uid) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Paitent').document("123456").collection('123456');

    return await profileList.document(uid).updateData({
      'name': name, 'gender': gender, 'score': score
    });
  }

  Future getUsersList(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Paitent').document(id.toString()).collection("Schedule");

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getEmergencyCall(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Emergency').document(id.toString()).collection("Schedule");

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getWating(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Doctor').document(id.toString()).collection('Waiting');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getHosShedule(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Doctor').document(id.toString()).collection('Schedule');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getSView() async {
    final CollectionReference profileList =
    Firestore.instance.collection('Support').document("12345678910").collection('Team');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<String> getFelid(int id,String field) async {
    var name;
    final DocumentReference result =
    await Firestore.instance.collection('Paitent').document(id.toString());
    result.get().then((snapshot) {
      name = snapshot.data.length;
    });
    return name;
  }
  Future getMedicines(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Paitent').document(id.toString()).collection('Medicines');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getSupport(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Support').document(id.toString()).collection('Team');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getReqHos(int id) async {
    final CollectionReference profileList =
    Firestore.instance.collection('Support').document(id.toString()).collection('Waiting');

    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<bool> addtowaiting(int id,String name,String section,String date,String note,String number) async {
    bool check = false ;
    bool accept = false ;

    final QuerySnapshot result =
        await Firestore.instance.collection('Doctor').getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    documents.forEach((data) {
      print(data.data["hospital"]);
      if (data.data["hospital"]==name){
        askDate(int.parse(data.documentID),id, name, int.parse(number), section, date, note, accept);
        check=true;
      }
      else
        check= false;
    });
    return check;
  }
}