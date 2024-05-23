import 'package:apiwith_provider/models/pets_model.dart';
import 'package:apiwith_provider/provider/pets_provider.dart';
import 'package:apiwith_provider/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late PetsProvider provider;
  bool loading = true;

  @override
  void initState() {
    provider = Provider.of<PetsProvider>(context, listen: false);
    provider.getAllPets().then((value) {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 168, 168),
        centerTitle: true,
        title: Text('PetScreen', style: boldBlack),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Selector<PetsProvider, PetsModel?>(
              selector: (p0, p1) => p1.pets,
              builder: (context, pets, child) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: pets?.data.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundImage: CachedNetworkImageProvider(
                          pets?.data[index].petImage ?? 'no image',
                        ) as ImageProvider<Object>,

                        // NetworkImage(
                        //     pets?.data[index].petImage ?? 'no image'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(pets?.data[index].petName ?? 'no petname'),
                      trailing: pets!.data[index].isFriendly
                          ? const SizedBox()
                          : const Icon(
                              Icons.pets,
                              color: Colors.red,
                            ),
                    );
                  },
                );
              },
            ),
    );
  }
}
