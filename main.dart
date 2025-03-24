import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog Mobil',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CarCatalogScreen(),
    );
  }
}

class Car {
  String name;
  List<String> images;
  String description;
  String engineType;
  String mileage;
  String price;
  String transmission;

  Car({
    required this.name,
    required this.images,
    required this.description,
    required this.engineType,
    required this.mileage,
    required this.price,
    required this.transmission,
  });
}

class CarCatalogScreen extends StatefulWidget {
  const CarCatalogScreen({super.key});

  @override
  _CarCatalogScreenState createState() => _CarCatalogScreenState();
}

class _CarCatalogScreenState extends State<CarCatalogScreen> {
  final List<Car> _cars = [
    Car(
      name: 'Toyota Supra',
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/2020_Toyota_GR_Supra_%28United_States%29.png/1200px-2020_Toyota_GR_Supra_%28United_States%29.png'
      ],
      description: 'Sports car with turbo engine.',
      engineType: '3.0L Turbocharged Inline-6',
      mileage: '10,000 km',
      price: '\$50,000',
      transmission: 'Automatic',
    ),
    Car(
      name: 'Honda Civic',
      images: [
        'https://www.cnet.com/a/img/resize/9df45ef52fa5b58b195d20a707d8507dbe3f01a9/hub/2020/06/08/f9a764a7-bd53-4716-b20e-cbd9d1a4d1bc/civic-front.jpg?auto=webp&width=1200'
      ],
      description: 'Compact and reliable.',
      engineType: '2.0L I4',
      mileage: '20,000 km',
      price: '\$25,000',
      transmission: 'Manual',
    ),
    Car(
      name: '2005 Hyundai Sonata',
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/2005_Hyundai_Sonata_%28NF%29_LX_sedan_%282015-07-03%29_01.jpg/1200px-2005_Hyundai_Sonata_%28NF%29_LX_sedan_%282015-07-03%29_01.jpg'
      ],
      description: 'Korean luxury car with advance features.',
      engineType: '2000cc',
      mileage: '90,000km',
      price: '14,000',
      transmission: 'Manual',
    ),
  ];

  void _addCar(Car car) {
    setState(() {
      _cars.add(car);
    });
  }

  void _updateCar(int index, Car updatedCar) {
    setState(() {
      _cars[index] = updatedCar;
    });
  }

  void _removeCar(int index) {
    setState(() {
      _cars.removeAt(index);
    });
  }

  void _showAddCarDialog() {
    final nameController = TextEditingController();
    final imageController = TextEditingController();
    final descriptionController = TextEditingController();
    final engineTypeController = TextEditingController();
    final mileageController = TextEditingController();
    final priceController = TextEditingController();
    final transmissionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Mobil Baru'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'URL Gambar'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextField(
                  controller: engineTypeController,
                  decoration: const InputDecoration(labelText: 'Tipe Mesin'),
                ),
                TextField(
                  controller: mileageController,
                  decoration: const InputDecoration(labelText: 'Mileage'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Harga'),
                ),
                TextField(
                  controller: transmissionController,
                  decoration: const InputDecoration(labelText: 'Transmisi'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _addCar(Car(
                  name: nameController.text,
                  images: [imageController.text],
                  description: descriptionController.text,
                  engineType: engineTypeController.text,
                  mileage: mileageController.text,
                  price: priceController.text,
                  transmission: transmissionController.text,
                ));
                Navigator.pop(context);
              },
              child: const Text('Tambahkan'),
            ),
          ],
        );
      },
    );
  }

  void _showEditCarDialog(int index) {
    final car = _cars[index];
    final nameController = TextEditingController(text: car.name);
    final imageController = TextEditingController(text: car.images.first);
    final descriptionController = TextEditingController(text: car.description);
    final engineTypeController = TextEditingController(text: car.engineType);
    final mileageController = TextEditingController(text: car.mileage);
    final priceController = TextEditingController(text: car.price);
    final transmissionController = TextEditingController(text: car.transmission);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Mobil'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'URL Gambar'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextField(
                  controller: engineTypeController,
                  decoration: const InputDecoration(labelText: 'Tipe Mesin'),
                ),
                TextField(
                  controller: mileageController,
                  decoration: const InputDecoration(labelText: 'Mileage'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Harga'),
                ),
                TextField(
                  controller: transmissionController,
                  decoration: const InputDecoration(labelText: 'Transmisi'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _updateCar(
                  index,
                  Car(
                    name: nameController.text,
                    images: [imageController.text],
                    description: descriptionController.text,
                    engineType: engineTypeController.text,
                    mileage: mileageController.text,
                    price: priceController.text,
                    transmission: transmissionController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = _cars.expand((car) => car.images).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Used Car Dealership'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (carouselImages.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                  items: carouselImages.map((image) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _cars.length,
                  itemBuilder: (context, index) {
                    final car = _cars[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailScreen(car: car),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  car.images.first,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey[300],
                                      child: const Icon(
                                          Icons.error,
                                          color: Colors.red),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      car.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      car.description,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Engine: ${car.engineType}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Mileage: ${car.mileage}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Price: \$${car.price}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    Text(
                                      'Transmission: ${car.transmission}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      _showEditCarDialog(index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      _removeCar(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 60), // Space for the button
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _showAddCarDialog,
                icon: const Icon(Icons.add),
                label: const Text('Add Car'),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0, enableInfiniteScroll: false),
              items: car.images.map((image) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: 1000.0,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 250,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car.description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Text('Engine Type: ${car.engineType}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text('Mileage: ${car.mileage}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text('Price: \$${car.price}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  const SizedBox(height: 5),
                  Text('Transmission: ${car.transmission}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact Dealership'),
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