
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title:  "App Title",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: MyApp(),
    ),
  ));
}




class MyApp extends StatefulWidget {
    
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class  _MyAppState extends State<MyApp> {

String _Value = "name";
String Valu1 = "Class Name";
String Valu3 = "RollNumber";


  final _formKey  = GlobalKey <FormState>();

    
  
 

DateTime selectedDate = DateTime.now();





  Future <void>_selectDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:  selectedDate,
        firstDate:  DateTime(2016,8),
        lastDate:  DateTime.now()
    )
    .then((pickedDate) {
    
   if( pickedDate ==null) {
     return;
     }
     setState(() {
      selectedDate = pickedDate;}
   );
   });
  }
   
  @override


   
   Widget build(BuildContext context){
    return Form(key: _formKey,
      child:Column(children: [

      
        
        
    
    
        
      TextFormField(
   
       decoration:  InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
                  icon: Icon(Icons.people)
      ),
       validator: (String? value) {
              if (value ==null|| value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
      ),
      
       TextFormField(
        
          
        decoration:InputDecoration(
          labelText: "Class",
          hintText: 'Class',
           icon: Icon(Icons.people)
        ) ,
         validator: (String? value) {
              if (value ==null|| value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
      ),
      
     TextFormField(
     
        decoration: InputDecoration(
          labelText: "Roll Number",
          hintText: "Roll Number",
           icon: Icon(Icons.people)
        ),
         validator: (String? value) {
              if (value ==null|| value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
      ),
      TextFormField(

       controller:TextEditingController(
         text:"${selectedDate.toLocal()}".split(' ')[0] 
         ),
        
        
          
        decoration: InputDecoration(
          labelText: "Enter Date of Birth",
          hintText: "yyyy/mm/dd",
          icon: Icon(
            Icons.calendar_today)
      
        ),
         validator: (String? value) {
              if (value==null||value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
              
            },    
      ),
    
      ElevatedButton(onPressed:() =>  _selectDate(context), child: Text('Seclect Date'),
      ),





Padding(padding:const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(onPressed: (){
        if (_formKey.currentState!.validate()){
          //_formKey.currentState !.save();
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Successfull submit')),
           );
        };

        
      },
      child: const Text('Submit'),
        ),
      )
    
        ],),);
        
    
   }
}




