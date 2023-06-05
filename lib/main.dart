import 'package:flutter/material.dart';
import 'profile.dart';
import 'materi.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/profile': (context) => ProfilePage(),
      '/materi': (context) => MateriPage(),
    },
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'), // Mengubah judul AppBar menjadi "Login"
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: Align(
            alignment: Alignment.center,
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Login', // Mengubah judul "Login"
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Perform login logic here
                Navigator.pushNamed(context, '/home');
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://source.unsplash.com/200x200/?portrait'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?IPA', 'IPA'),
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?IPS', 'IPS'),
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?number', 'Matematika'),
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?programmer',
                    'Informatika'),
                _buildMateriCard('https://source.unsplash.com/400x200?english',
                    'Bahasa Inggris'),
                _buildMateriCard('https://source.unsplash.com/400x200?anime',
                    'Bahasa Jepang'),
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?sport', 'Penjas'),
                _buildMateriCard(
                    'https://source.unsplash.com/400x200?history', 'Sejarah'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }

  Widget _buildMateriCard(String imageUrl, String title) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({Key? key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Materi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      onTap: (int index) {
        if (index == 1) {
          Navigator.pushNamed(context, '/materi');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        }
      },
    );
  }
}
