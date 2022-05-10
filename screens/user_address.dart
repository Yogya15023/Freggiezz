import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freggies/providers/address.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserAddress extends StatefulWidget {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  final _addressFocusNode = FocusNode();
  final _mobFocusNode = FocusNode();
  final _zipFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedAddress = Address(name: '', address: '', zipcode: 0, mob: 0);

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _mobFocusNode.dispose();
    _zipFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final _isValid = _form.currentState.validate();
    if (!_isValid) {
      return;
    }
    _form.currentState.save();
    // ignore: unnecessary_statements
    Provider.of<Address>(context, listen: false).address;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('delivery Address'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Address Saved'),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_addressFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedAddress = Address(
                        name: value,
                        address: _editedAddress.address,
                        zipcode: _editedAddress.zipcode,
                        mob: _editedAddress.mob);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _addressFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_zipFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an address';
                    }
                    if (value.length < 10) {
                      return 'Please provide a landmark';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedAddress = Address(
                        name: _editedAddress.name,
                        address: value,
                        zipcode: _editedAddress.zipcode,
                        mob: _editedAddress.mob);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Zip-code',
                      counterText: '',
                      prefixText: '8270'),
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  focusNode: _zipFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_mobFocusNode);
                  },
                  validator: (value) {
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid zipCode';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Please enter a valid zipCode';
                    }
                    if (value.length < 2) {
                      return 'Please enter a valid zipCode';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedAddress = Address(
                        name: _editedAddress.name,
                        address: _editedAddress.address,
                        zipcode: int.parse(value),
                        mob: _editedAddress.mob);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CITY : Bokaro',
                  ),
                  textInputAction: TextInputAction.next,
                  readOnly: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    counterText: '',
                    prefixIcon: Icon(Icons.phone),
                    prefixText: '+91',
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  focusNode: _mobFocusNode,
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  validator: (value) {
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedAddress = Address(
                      name: _editedAddress.name,
                      address: _editedAddress.address,
                      zipcode: _editedAddress.zipcode,
                      mob: int.parse(value),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
