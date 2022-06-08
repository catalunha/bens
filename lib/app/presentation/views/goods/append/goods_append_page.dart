import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:bens/app/presentation/views/goods/append/parts/app_add_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/views/utils/app_appbar.dart';
import 'package:bens/app/presentation/views/utils/app_number_formfield.dart';
import 'package:bens/app/presentation/views/utils/app_textformfield.dart';
import 'package:validatorless/validatorless.dart';

class GoodsAppendPage extends StatefulWidget {
  final GoodsController _goodsController = Get.find();

  GoodsAppendPage({Key? key}) : super(key: key);

  @override
  State<GoodsAppendPage> createState() => _ProductAppendPageState();
}

class _ProductAppendPageState extends State<GoodsAppendPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTEC = TextEditingController();
  final _descriptionTEC = TextEditingController();
  final _ownershipTEC = TextEditingController();
  final _roomTEC = TextEditingController();
  final _volumeXTEC = TextEditingController();
  final _volumeYTEC = TextEditingController();
  final _volumeZTEC = TextEditingController();
  final _weightTEC = TextEditingController();
  final _latTEC = TextEditingController();
  final _longTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameTEC.text = widget._goodsController.goods?.name ?? '';
    _descriptionTEC.text =
        widget._goodsController.goods?.description.toString() ?? '';
    _ownershipTEC.text =
        widget._goodsController.goods?.ownership.toString() ?? '';
    _roomTEC.text = widget._goodsController.goods?.room.toString() ?? '';
    _volumeXTEC.text = widget._goodsController.goods?.volumeX?.toString() ?? '';
    _volumeYTEC.text = widget._goodsController.goods?.volumeY?.toString() ?? '';
    _volumeZTEC.text = widget._goodsController.goods?.volumeZ?.toString() ?? '';
    _weightTEC.text = widget._goodsController.goods?.weight?.toString() ?? '';
    _latTEC.text = widget._goodsController.goods?.latitude?.toString() ?? '';
    _longTEC.text = widget._goodsController.goods?.longitude?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: Text(
            '${widget._goodsController.goods == null ? "Criar" : "Editar"} marco'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AppTextFormField(
                  label: 'Nome do patrimonio',
                  controller: _nameTEC,
                  validator: Validatorless.required('Nome é obrigatório'),
                ),
                AppTextFormField(
                  label: 'Descrição do patrimonio',
                  controller: _descriptionTEC,
                  validator: Validatorless.required('Descrição é obrigatória'),
                ),
                AppTextFormField(
                  label: 'Imovel onde se localiza o patrimonio',
                  controller: _ownershipTEC,
                  validator: Validatorless.required('Imovel é obrigatório'),
                ),
                AppTextFormField(
                  label: 'Sala/Ambiente onde se localiza o patrimonio',
                  controller: _roomTEC,
                  validator:
                      Validatorless.required('Sala/Ambiente é obrigatório'),
                ),
             AppAddPhoto(xfile: (xfile ) {widget._goodsController.  },photo: widget._goodsController.goods?.image,),
                AppNumberFormField(
                  label: 'Comprimento X',
                  controller: _volumeXTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(0, 'Maior que 0'),
                    // Validatorless.max(10000000, 'Menor que 10000000'),
                  ]),
                ),
                AppNumberFormField(
                  label: 'Comprimento Y (em mm)',
                  controller: _volumeYTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(0, 'Maior que 0'),
                    // Validatorless.max(10000000, 'Menor que 10000000'),
                  ]),
                ),
                AppNumberFormField(
                  label: 'Comprimento Z (e mm)',
                  controller: _volumeZTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(0, 'Maior que 0'),
                    // Validatorless.max(10000000, 'Menor que 10000000'),
                  ]),
                ),
                AppNumberFormField(
                  label: 'Peso em gramas',
                  controller: _volumeZTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(0, 'Maior que 0'),
                    // Validatorless.max(10000000, 'Menor que 10000000'),
                  ]),
                ),
                AppNumberFormField(
                  label: 'Latitude (decimais)',
                  controller: _latTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(-90, 'Maior que -90'),
                    // Validatorless.max(90, 'Menor que 90'),
                  ]),
                ),
                AppNumberFormField(
                  label: 'Longitude (decimais)',
                  controller: _longTEC,
                  validator: Validatorless.multiple([
                    Validatorless.number('Informe um número válido'),
                    // Validatorless.min(-180, 'Maior que -180'),
                    // Validatorless.max(180, 'Menor que 180'),
                  ]),
                ),
                const SizedBox(height: 16),
                delete(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // backgroundColor: context.primaryColor,
        onPressed: () async {
          final formValid = _formKey.currentState?.validate() ?? false;
          if (formValid) {
            await widget._goodsController.append(
              name: _nameTEC.text,
              description: _descriptionTEC.text,
              ownership: _ownershipTEC.text,
              room: _roomTEC.text,
              volumeX: double.tryParse(_volumeXTEC.text),
              volumeY: double.tryParse(_volumeYTEC.text),
              volumeZ: double.tryParse(_volumeZTEC.text),
              weight: double.tryParse(_weightTEC.text),
            );
            Get.back();
          }
        },
        label: const Text(
          'Salvar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Visibility delete() {
    return Visibility(
      visible: widget._goodsController.goods != null,
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(
            Icons.delete_forever,
          ),
          onPressed: () {
            widget._goodsController.delete(widget._goodsController.goods!.id!);
          },
          tooltip: 'Apagar',
        ),
      ),
    );
  }
}
