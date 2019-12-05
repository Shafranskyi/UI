import 'package:flutter/material.dart';
import 'package:cupertino_range_slider/cupertino_range_slider.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/styling.dart';

class RangeSliderItem extends StatefulWidget {
  final int initialMinValue;
  final int initialMaxValue;
  final ValueChanged<int> onMinValueChanged;
  final ValueChanged<int> onMaxValueChanged;

  const RangeSliderItem({Key key, this.initialMinValue, this.initialMaxValue, this.onMinValueChanged, this.onMaxValueChanged}) : super(key: key);

  @override
  _RangeSliderItemState createState() => _RangeSliderItemState();
}

class _RangeSliderItemState extends State<RangeSliderItem> {
  int minValue;
  int maxValue;


  @override
  void initState() {
    super.initState();
    minValue = widget.initialMinValue;
    maxValue = widget.initialMaxValue;
  }

  @override
  Widget build(BuildContext context) {
    return FilterItemHolder(
      value: '\$$minValue - \$$maxValue',
      child: CupertinoRangeSlider(
        activeColor: AppTheme.selectedTabBackgroundColor,
        minValue: minValue.roundToDouble(),
        maxValue: maxValue.roundToDouble(),
        min: 1.0,
        max: 50000.0,
        onMinChanged: (minVal){
          setState(() {
            minValue = minVal.round();
            if(widget.onMinValueChanged != null) {
              widget.onMinValueChanged(minValue);
            }
          });
        },
        onMaxChanged: (maxVal){
          setState(() {
            maxValue = maxVal.round();
            if(widget.onMaxValueChanged != null) {
              widget.onMaxValueChanged(maxValue);
            }
          });
        },
      ),
    );
  }
}

class FilterItemHolder extends StatelessWidget {
  final String value;
  final Widget child;

  FilterItemHolder({Key key, this.value = '', this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
                child: Text(value, style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height, left: 3 * ResponsiveSize.width, right: 3 * ResponsiveSize.width),
          decoration: BoxDecoration(
            color: AppTheme.white,
          ),
          child: Container(
            height: 7 * ResponsiveSize.height,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}