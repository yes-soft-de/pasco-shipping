import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
 final Function onTap;
 final String initValue;
  NumberInputWithIncrementDecrement( this.initValue,this.onTap);
  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initValue; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(start: 20,top: 10),
      child: Container(
        width: 100.0,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: greyWhite,
            width: 2.0,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                controller: _controller,
                onChanged: (v){
                  widget.onTap(v);
                },
                // style: white18text,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),

            Container(
              height: 38.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_drop_up,
                        size: 18.0,
                        color: greyWhite,
                      ),
                      onTap: () {
                        int currentValue = int.parse(_controller.text);
                        setState(() {
                          currentValue++;
                          _controller.text = (currentValue)
                              .toString(); // incrementing value
                        });
                        widget.onTap(_controller.text);
                      },
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 18.0,
                      color: greyWhite,
                    ),
                    onTap: () {
                      int currentValue = int.parse(_controller.text);
                      setState(() {
                        print("Setting state");
                        currentValue--;
                        _controller.text =
                            (currentValue > 0 ? currentValue : 0)
                                .toString(); // decrementing value
                      });
                      widget.onTap(_controller.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}