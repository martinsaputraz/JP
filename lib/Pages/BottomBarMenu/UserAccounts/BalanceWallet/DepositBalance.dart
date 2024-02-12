import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_hadiah/Settings/Constant.dart';
import 'package:intl/intl.dart';

class DepositBalance extends StatefulWidget {
  const DepositBalance({Key? key}) : super(key: key);

  @override
  State<DepositBalance> createState() => _DepositBalanceState();
}

Constants constants = Constants();
class _DepositBalanceState extends State<DepositBalance> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showTopUpCalculator() {
    TextEditingController _amountController = TextEditingController();


    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true for full-width
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6, // 70% of the screen height
          width: MediaQuery.of(context).size.width, // Full width of the screen
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add your calculator UI components here
              const Text(
                'Custom Deposit',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color
                ),
              ),

              // Text box for entering amount
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                      try {
                        final parsedValue = double.parse(newValue.text);
                        final formattedValue = NumberFormat.currency(decimalDigits: 2, symbol: '').format(parsedValue);
                        _amountController.value = _amountController.value.copyWith(
                          text: formattedValue,
                          selection: TextSelection.collapsed(offset: formattedValue.length),
                        );
                      } catch (e) {}
                      return newValue;
                    },
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Jumlah Deposit min Rp.10000',
                  labelStyle: TextStyle(fontSize: 16.0), // Set the font size for the label
                ),
                style: TextStyle(fontSize: 18.0), // Set the font size for the input text
                enabled: false,

              ),


              SizedBox(height: 15.0), // Add some space between the text box and the button

              // Grid of number buttons
          GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            childAspectRatio: 1.2, // Adjust this value to control the height
            children: List.generate(
              14, // Increased the count to accommodate the clear all button
                  (index) {
                return SizedBox(
                  width: 80.0, // Adjust the width of the buttons
                  height: 40.0, // Adjust the height of the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      if (index == 10) {
                        // Handle '00' case
                        _amountController.text += '00';
                      } else if (index == 11) {
                        // Handle '000' case
                        _amountController.text += '000';
                      } else if (index == 12) {
                        // Handle delete button
                        if (_amountController.text.isNotEmpty) {
                          _amountController.text = _amountController.text.substring(0, _amountController.text.length - 1);
                        }
                      } else if (index == 13) {
                        // Handle clear all button
                        _amountController.clear();
                      } else if (index == 9) {

                        _amountController.text += '9';
                      } else {
                        // Handle other cases
                        _amountController.text += index.toString();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(5.0), // Adjust the padding for smaller buttons
                      primary: Colors.redAccent, // Adjust the button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                      ),
                    ),
                    child: Text(
                      index == 10 ? '00' : index == 11 ? '000' : index == 12 ? 'DEL' : index == 13 ? 'Clear All' : index.toString(),
                      style: TextStyle(fontSize: 14.0, color: Colors.white)
                      // Set the text color to white
                    ),
                  ),
                );
              },
            ),
          ),
              SizedBox(height: 25.0), // SizedBox with height 15
              ElevatedButton(
                onPressed: () {
                  // Handle the new button press
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10.0), // Adjust the padding for the new button
                  primary: Colors.blue, // Adjust the button color for the new button
                  minimumSize: Size(double.infinity, 40.0), // Set the button width to full screen width
                ),
                child: const Text(
                  'DEPOSIT',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
          // ... Other calculator components
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController _amountControllerdepan = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Deposit Balance',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deposit label
            const Text(
              'Pilih Nilai Deposit  :',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.0),

            // Buttons in a 3x3 grid horizontally at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {

                      _amountControllerdepan.text = constants.Depo1;



                  },
                  child: Text('Rp.10000'),
                ),

                ElevatedButton(
                  onPressed: () {
                    _amountControllerdepan.text = constants.Depo2;
                  },
                  child: Text('Rp.15000'),
                ),
                SizedBox(width: 5.0),

                ElevatedButton(
                  onPressed: () {
                    _amountControllerdepan.text = constants.Depo3;

                  },
                  child: Text('Rp.20000'),
                ),
              ],
            ),

            SizedBox(height: 16.0), // Add some spacing between the custom button and the bottom buttons
            // Bottom 3 buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _amountControllerdepan.text = constants.Depo4;

                  },
                  child: Text('Rp.50000'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _amountControllerdepan.text = constants.Depo5;

                  },
                  child: Text('Rp.100000'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _amountControllerdepan.text = constants.Depo6;

                  },
                  child: Text('Rp.200000'),
                ),
              ],
            ),

            SizedBox(height: 16.0), // Add some spacing between the top and bottom buttons
            // Custom button to show the top-up calculator
            ElevatedButton(
              onPressed: _showTopUpCalculator,
              child: Text('Custom Deposit'),
            ),

            SizedBox(height: 35.0), // Add some spacing between the Custom Deposit button and the Card

            // Label above the Card
            const Text(
              'Jumlah Deposit Kamu :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.0),


            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.attach_money, // Money bag icon
                          color: Colors.green, // Customize the color as needed
                        ),
                        SizedBox(width: 8.0), // Add some spacing between the icon and text
                        Text(
                          'Jumlah Deposit min Rp.10000',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _amountControllerdepan,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        TextInputFormatter.withFunction(
                              (oldValue, newValue) {
                            try {
                              final parsedValue = double.parse(newValue.text);
                              final formattedValue =
                              NumberFormat.currency(decimalDigits: 2, symbol: '').format(parsedValue);
                              // Assign the formatted value back to the controller
                              _amountControllerdepan.text = formattedValue;
                            } catch (e) {}
                            return newValue;
                          },
                        ),
                      ],
                      onChanged: (value) {
                        // Call your function with the updated value
                      },
                      style: TextStyle(fontSize: 18.0),
                      enabled: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Remove the underline
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.0), // Add some spacing between the top and bottom buttons
            // Custom button to show the top-up calculator
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
            /*      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourCustomDepositScreen()),
                  );*/
                },
                child: Text('DEPOSIT'),
              ),
            ),


          ],
        ),
      ),
    );
  }




}
