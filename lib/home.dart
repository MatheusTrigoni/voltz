import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:voltz/components/botao_bottom_navigation_bar.dart';
import 'package:voltz/perfil.dart';
import './models/locais.dart';

class Home extends StatefulWidget {
  final String email;

  const Home({super.key, required this.email});

  static const Color cinzaEscuro = Color(0xFF2F2F2F);
  static const Color brancoAcizentado = Color(0xFFEAEAEA);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;
  final TextEditingController _searchController = TextEditingController();
  final Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    super.initState();
  }

  void _carregarLocais() {
    setState(() {
      for (var local in locais) {
        _markers.add(
            Marker(
                markerId: MarkerId(local.nome),
                position: local.localizacao,
                infoWindow: InfoWindow(title: local.nome)
            )
        );
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _carregarLocais();
  }

  void _moverCamera(String? lat, String? long) {
    try {
      if (lat != null && long != null) {
        double latDouble = double.parse(lat);
        double longDouble = double.parse(long);
        LatLng latLng = LatLng(latDouble, longDouble);

        mapController.animateCamera(CameraUpdate.newLatLng(latLng));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.089,
          flexibleSpace: const Image(
            image: AssetImage('images/fundo-app-bar.png'),
            fit: BoxFit.cover,
          ),
          elevation: 10,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.66,
                child: GooglePlaceAutoCompleteTextField(
                  textEditingController: _searchController,
                  googleAPIKey: dotenv.env['GOOGLE_MAPS_API_KEY']!,
                  countries: const ['br'],
                  itemClick: (sugestao) {
                    _moverCamera(sugestao.lat, sugestao.lng);
                  },
                  boxDecoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                  ),
                  inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Home.cinzaEscuro,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Home.brancoAcizentado),
                    hintText: 'Endereço, Shopping...',
                    hintStyle: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 16,
                      color: Color(0xFF898989),
                      fontWeight: FontWeight.normal
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-23.6665881, -46.7835859),
                zoom: 13
              ),
              markers: _markers,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
          height: MediaQuery.of(context).size.height * 0.122,
          decoration: const BoxDecoration(
            color: Home.cinzaEscuro,
            //borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BotaoBottomNavigationBar(titulo: 'Carteira', imagem: 'images/carteira.png'),
              const BotaoBottomNavigationBar(titulo: 'Pagar', imagem: 'images/qr-code.png'),
              const BotaoBottomNavigationBar(titulo: 'Carregar', imagem: 'images/bateria.png'),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil(email: widget.email,)));
                    },
                    icon: const Icon(Icons.person),
                    color: Home.brancoAcizentado,
                  ),
                  const Text(
                    'Perfil',
                    style: TextStyle(
                        color: Home.brancoAcizentado,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
