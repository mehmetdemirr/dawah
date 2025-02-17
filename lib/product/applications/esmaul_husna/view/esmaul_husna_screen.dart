import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EsmaulHusnaScreen extends StatefulWidget {
  const EsmaulHusnaScreen({super.key});

  @override
  State<EsmaulHusnaScreen> createState() => _EsmaulHusnaScreenState();
}

class _EsmaulHusnaScreenState extends State<EsmaulHusnaScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = esmaNames;
    _searchController.addListener(_filterNames);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterNames() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredNames = esmaNames.where((esma) {
        return esma['turkish']!.toLowerCase().contains(query) ||
            esma['meaning']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Esma veya anlam ara...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: filteredNames.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Sonuç bulunamadı',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredNames.length,
                        itemBuilder: (context, index) {
                          final esma = filteredNames[index];
                          return Hero(
                            tag: 'esma_${index + 1}',
                            child: _buildEsmaCard(
                              context,
                              number: esmaNames.indexOf(esma) + 1,
                              arabic: esma['arabic']!,
                              turkish: esma['turkish']!,
                              meaning: esma['meaning']!,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.router.back(),
              ),
              const Expanded(
                child: Text(
                  'Esmaül Hüsna',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  // TODO: Bilgi modalı göster
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Allah\'ın 99 İsmi',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEsmaCard(
    BuildContext context, {
    required int number,
    required String arabic,
    required String turkish,
    required String meaning,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // TODO: Detay sayfasına git
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(0.5),
                              Theme.of(context).primaryColor,
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            number.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              turkish,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              meaning,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      arabic,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arabic',
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> esmaNames = [
  {
    'arabic': 'الله',
    'turkish': 'Allah',
    'meaning':
        'Varlığı zorunlu olan ve bütün övgülere layık bulunan yüce yaratıcı',
  },
  {
    'arabic': 'الرَّحْمَنُ',
    'turkish': 'Er-Rahman',
    'meaning': 'Bütün yaratılmışlara merhamet eden, şefkat gösteren',
  },
  {
    'arabic': 'الرَّحِيمُ',
    'turkish': 'Er-Rahim',
    'meaning': 'Ahirette, müminlere sonsuz ikramlarda bulunan',
  },
  {
    'arabic': 'الْمَلِكُ',
    'turkish': 'El-Melik',
    'meaning': 'Mülkün, varlığın gerçek sahibi',
  },
  {
    'arabic': 'الْقُدُّوسُ',
    'turkish': 'El-Kuddûs',
    'meaning': 'Her türlü eksiklikten uzak olan',
  },
  {
    'arabic': 'السَّلاَمُ',
    'turkish': 'Es-Selâm',
    'meaning': 'Her türlü tehlikelerden selamete çıkaran',
  },
  {
    'arabic': 'الْمُؤْمِنُ',
    'turkish': "El-Mü'min",
    'meaning': 'Güven veren, emin kılan',
  },
  {
    'arabic': 'الْمُهَيْمِنُ',
    'turkish': 'El-Müheymin',
    'meaning': 'Her şeyi görüp gözeten',
  },
  {
    'arabic': 'الْعَزِيزُ',
    'turkish': 'El-Azîz',
    'meaning': 'Üstün ve güçlü olan',
  },
  {
    'arabic': 'الْجَبَّارُ',
    'turkish': 'El-Cebbâr',
    'meaning': 'İradesini her durumda yürüten',
  },
  {
    'arabic': 'الْمُتَكَبِّرُ',
    'turkish': 'El-Mütekebbir',
    'meaning': 'Büyüklükte eşi olmayan',
  },
  {
    'arabic': 'الْخَالِقُ',
    'turkish': 'El-Hâlık',
    'meaning': 'Yaratan, yoktan var eden',
  },
  {
    'arabic': 'الْبَارِئُ',
    'turkish': 'El-Bâri',
    'meaning': 'Her şeyi kusursuz ve uyumlu yaratan',
  },
  {
    'arabic': 'الْمُصَوِّرُ',
    'turkish': 'El-Musavvir',
    'meaning': 'Her şeye şekil veren',
  },
  {
    'arabic': 'الْغَفَّارُ',
    'turkish': 'El-Ğaffâr',
    'meaning': 'Günahları örten ve çok mağfiret eden',
  },
  {
    'arabic': 'الْقَهَّارُ',
    'turkish': 'El-Kahhâr',
    'meaning': 'Her şeye galip gelen',
  },
  {
    'arabic': 'الْوَهَّابُ',
    'turkish': 'El-Vehhâb',
    'meaning': 'Karşılıksız nimetler veren',
  },
  {
    'arabic': 'الرَّزَّاقُ',
    'turkish': 'Er-Rezzâk',
    'meaning': 'Bütün yaratılmışların rızkını veren',
  },
  {
    'arabic': 'الْفَتَّاحُ',
    'turkish': 'El-Fettâh',
    'meaning': 'Her türlü sıkıntıları gideren',
  },
  {
    'arabic': 'اَلْعَلِيمُ',
    'turkish': 'El-Alîm',
    'meaning': 'Her şeyi en iyi bilen',
  },
  {
    'arabic': 'الْقَابِضُ',
    'turkish': 'El-Kâbıd',
    'meaning': 'Dilediğine darlık veren',
  },
  {
    'arabic': 'الْبَاسِطُ',
    'turkish': 'El-Bâsıt',
    'meaning': 'Dilediğine bolluk veren',
  },
  {
    'arabic': 'الْخَافِضُ',
    'turkish': 'El-Hâfıd',
    'meaning': 'Dereceleri alçaltan',
  },
  {
    'arabic': 'الرَّافِعُ',
    'turkish': 'Er-Râfi',
    'meaning': 'Dereceleri yükselten',
  },
  {
    'arabic': 'الْمُعِزُّ',
    'turkish': "El-Mu'iz",
    'meaning': 'Dilediğini aziz eden',
  },
  {
    'arabic': 'المُذِلُّ',
    'turkish': 'El-Müzil',
    'meaning': 'Dilediğini zillete düşüren',
  },
  {
    'arabic': 'السَّمِيعُ',
    'turkish': 'Es-Semi',
    'meaning': 'Her şeyi en iyi işiten',
  },
  {
    'arabic': 'الْبَصِيرُ',
    'turkish': 'El-Basîr',
    'meaning': 'Her şeyi en iyi gören',
  },
  {
    'arabic': 'الْحَكَمُ',
    'turkish': 'El-Hakem',
    'meaning': 'Mutlak hakim olan',
  },
  {
    'arabic': 'الْعَدْلُ',
    'turkish': 'El-Adl',
    'meaning': 'Mutlak adil olan',
  },
  {
    'arabic': 'اللَّطِيفُ',
    'turkish': 'El-Latîf',
    'meaning': 'Lütuf ve ihsan sahibi olan',
  },
  {
    'arabic': 'الْخَبِيرُ',
    'turkish': 'El-Habîr',
    'meaning': 'Her şeyden haberdar olan',
  },
  {
    'arabic': 'الْحَلِيمُ',
    'turkish': 'El-Halîm',
    'meaning': 'Yumuşak davranan, cezada acele etmeyen',
  },
  {
    'arabic': 'الْعَظِيمُ',
    'turkish': 'El-Azîm',
    'meaning': 'Büyüklükte eşi olmayan',
  },
  {
    'arabic': 'الْغَفُورُ',
    'turkish': 'El-Ğafûr',
    'meaning': 'Çok affedici olan',
  },
  {
    'arabic': 'الشَّكُورُ',
    'turkish': 'Eş-Şekûr',
    'meaning': 'Az amele çok sevap veren',
  },
  {
    'arabic': 'الْعَلِيُّ',
    'turkish': 'El-Aliyy',
    'meaning': 'Yücelikte en üstün olan',
  },
  {
    'arabic': 'الْكَبِيرُ',
    'turkish': 'El-Kebîr',
    'meaning': 'Büyüklükte sınırsız olan',
  },
  {
    'arabic': 'الْحَفِيظُ',
    'turkish': 'El-Hafîz',
    'meaning': 'Her şeyi koruyucu olan',
  },
  {
    'arabic': 'المُقيِت',
    'turkish': 'El-Mukît',
    'meaning': 'Her yaratılmışın rızkını veren',
  },
  {
    'arabic': 'الْحسِيبُ',
    'turkish': 'El-Hasîb',
    'meaning': 'Hesaba çeken',
  },
  {
    'arabic': 'الْجَلِيلُ',
    'turkish': 'El-Celîl',
    'meaning': 'Celal ve azamet sahibi olan',
  },
  {
    'arabic': 'الْكَرِيمُ',
    'turkish': 'El-Kerîm',
    'meaning': 'Keremi, lütuf ve ihsanı bol',
  },
  {
    'arabic': 'الرَّقِيبُ',
    'turkish': 'Er-Rakîb',
    'meaning': 'Her şeyi gözetleyen',
  },
  {
    'arabic': 'الْمُجِيبُ',
    'turkish': 'El-Mucîb',
    'meaning': 'Duaları kabul eden',
  },
  {
    'arabic': 'الْوَاسِعُ',
    'turkish': 'El-Vâsi',
    'meaning': 'İlmi ve rahmeti her şeyi kuşatan',
  },
  {
    'arabic': 'الْحَكِيمُ',
    'turkish': 'El-Hakîm',
    'meaning': 'Her işi hikmetli olan',
  },
  {
    'arabic': 'الْوَدُودُ',
    'turkish': 'El-Vedûd',
    'meaning': 'Kullarını çok seven',
  },
  {
    'arabic': 'الْمَجِيدُ',
    'turkish': 'El-Mecîd',
    'meaning': 'Şerefi çok yüce olan',
  },
  {
    'arabic': 'الْبَاعِثُ',
    'turkish': 'El-Bâis',
    'meaning': 'Ölüleri dirilten',
  },
  {
    'arabic': 'الشَّهِيدُ',
    'turkish': 'Eş-Şehîd',
    'meaning': 'Her şeye şahit olan',
  },
  {
    'arabic': 'الْحَقُّ',
    'turkish': 'El-Hakk',
    'meaning': 'Varlığı hiç değişmeden duran',
  },
  {
    'arabic': 'الْوَكِيلُ',
    'turkish': 'El-Vekîl',
    'meaning': 'Kulların işlerini yerine getiren',
  },
  {
    'arabic': 'الْقَوِيُّ',
    'turkish': 'El-Kaviyy',
    'meaning': 'Kudreti en üstün olan',
  },
  {
    'arabic': 'الْمَتِينُ',
    'turkish': 'El-Metîn',
    'meaning': 'Kuvvet ve kudret menbaı olan',
  },
  {
    'arabic': 'الْوَلِيُّ',
    'turkish': 'El-Veliyy',
    'meaning': 'Müminlere dost ve yardımcı olan',
  },
  {
    'arabic': 'الْحَمِيدُ',
    'turkish': 'El-Hamîd',
    'meaning': 'Her türlü hamd ve senaya layık olan',
  },
  {
    'arabic': 'الْمُحْصِي',
    'turkish': 'El-Muhsî',
    'meaning': 'Her şeyin sayısını bilen',
  },
  {
    'arabic': 'الْمُبْدِئُ',
    'turkish': 'El-Mübdi',
    'meaning': 'Yaratılmışları yoktan yaratan',
  },
  {
    'arabic': 'الْمُعِيدُ',
    'turkish': 'El-Muîd',
    'meaning': 'Yaratılmışları yeniden diriltecek olan',
  },
  {
    'arabic': 'الْمُحْيِي',
    'turkish': 'El-Muhyî',
    'meaning': 'Can veren, dirilten',
  },
  {
    'arabic': 'اَلْمُمِيتُ',
    'turkish': 'El-Mümît',
    'meaning': 'Her canlıya ölümü tattıran',
  },
  {
    'arabic': 'الْحَيُّ',
    'turkish': 'El-Hayy',
    'meaning': 'Ebedi hayat sahibi olan',
  },
  {
    'arabic': 'الْقَيُّومُ',
    'turkish': 'El-Kayyûm',
    'meaning': 'Zatı ile kaim olan',
  },
  {
    'arabic': 'الْوَاجِدُ',
    'turkish': 'El-Vâcid',
    'meaning': 'Dilediğini dilediği anda bulan',
  },
  {
    'arabic': 'الْمَاجِدُ',
    'turkish': 'El-Mâcid',
    'meaning': 'Şanı yüce olan',
  },
  {
    'arabic': 'الْواحِدُ',
    'turkish': 'El-Vâhid',
    'meaning': 'Tek olan, eşi olmayan',
  },
  {
    'arabic': 'اَلاَحَدُ',
    'turkish': 'El-Ehad',
    'meaning': 'Birliği tek olan',
  },
  {
    'arabic': 'الصَّمَدُ',
    'turkish': 'Es-Samed',
    'meaning':
        'Her şey kendisine muhtaç olup, kendisi hiçbir şeye muhtaç olmayan',
  },
  {
    'arabic': 'الْقَادِرُ',
    'turkish': 'El-Kâdir',
    'meaning': 'Dilediğini dilediği gibi yapmaya gücü yeten',
  },
  {
    'arabic': 'الْمُقْتَدِرُ',
    'turkish': 'El-Muktedir',
    'meaning': 'Her şeye gücü yeten',
  },
  {
    'arabic': 'الْمُقَدِّمُ',
    'turkish': 'El-Mukaddim',
    'meaning': 'Dilediğini yükselten',
  },
  {
    'arabic': 'الْمُؤَخِّرُ',
    'turkish': 'El-Muahhir',
    'meaning': 'Dilediğini alçaltan',
  },
  {
    'arabic': 'الأوَّلُ',
    'turkish': 'El-Evvel',
    'meaning': 'Başlangıcı olmayan',
  },
  {
    'arabic': 'الآخِرُ',
    'turkish': 'El-Âhir',
    'meaning': 'Sonu olmayan',
  },
  {
    'arabic': 'الظَّاهِرُ',
    'turkish': 'Ez-Zâhir',
    'meaning': 'Varlığı açık olan',
  },
  {
    'arabic': 'الْبَاطِنُ',
    'turkish': 'El-Bâtın',
    'meaning': 'Mahiyeti gizli olan',
  },
  {
    'arabic': 'الْوَالِي',
    'turkish': 'El-Vâlî',
    'meaning': 'Kainatı idare eden',
  },
  {
    'arabic': 'الْمُتَعَالِي',
    'turkish': 'El-Müteâlî',
    'meaning': 'Son derece yüce olan',
  },
  {
    'arabic': 'الْبَرُّ',
    'turkish': 'El-Berr',
    'meaning': 'İyilik ve ihsanı bol olan',
  },
  {
    'arabic': 'التَّوَابُ',
    'turkish': 'Et-Tevvâb',
    'meaning': 'Tevbeleri kabul eden',
  },
  {
    'arabic': 'الْمُنْتَقِمُ',
    'turkish': 'El-Müntakim',
    'meaning': 'Suçluları cezalandıran',
  },
  {
    'arabic': 'العَفُوُّ',
    'turkish': 'El-Afüvv',
    'meaning': 'Affı çok olan',
  },
  {
    'arabic': 'الرَّؤُوفُ',
    'turkish': 'Er-Raûf',
    'meaning': 'Çok merhametli olan',
  },
  {
    'arabic': 'مَالِكُ الْمُلْكِ',
    'turkish': "Mâlikü'l-Mülk",
    'meaning': 'Mülkün gerçek sahibi olan',
  },
  {
    'arabic': 'ذُوالْجَلاَلِ وَالإكْرَامِ',
    'turkish': "Zül-Celâli ve'l-İkrâm",
    'meaning': 'Celal ve ikram sahibi olan',
  },
  {
    'arabic': 'الْمُقْسِطُ',
    'turkish': 'El-Muksit',
    'meaning': 'Her işi birbirine denk yapan',
  },
  {
    'arabic': 'الْجَامِعُ',
    'turkish': 'El-Câmi',
    'meaning': 'İstediğini bir araya toplayan',
  },
  {
    'arabic': 'الْغَنِيُّ',
    'turkish': 'El-Ğaniyy',
    'meaning': 'Zenginlik sahibi olan',
  },
  {
    'arabic': 'الْمُغْنِي',
    'turkish': 'El-Muğnî',
    'meaning': 'Dilediğini zengin eden',
  },
  {
    'arabic': 'اَلْمَانِعُ',
    'turkish': 'El-Mâni',
    'meaning': 'Dilediği şeye mani olan',
  },
  {
    'arabic': 'الضَّارَّ',
    'turkish': 'Ed-Dârr',
    'meaning': 'Elem ve zarar verenleri yaratan',
  },
  {
    'arabic': 'النَّافِعُ',
    'turkish': 'En-Nâfi',
    'meaning': 'Fayda veren şeyleri yaratan',
  },
  {
    'arabic': 'النُّورُ',
    'turkish': 'En-Nûr',
    'meaning': 'Alemleri nurlandıran',
  },
  {
    'arabic': 'الْهَادِي',
    'turkish': 'El-Hâdî',
    'meaning': 'Hidayet veren',
  },
  {
    'arabic': 'الْبَدِيعُ',
    'turkish': 'El-Bedî',
    'meaning': 'Eşsiz yaratan',
  },
  {
    'arabic': 'اَلْبَاقِي',
    'turkish': 'El-Bâkî',
    'meaning': 'Varlığının sonu olmayan',
  },
  {
    'arabic': 'الْوَارِثُ',
    'turkish': 'El-Vâris',
    'meaning': 'Her şeyin asıl sahibi olan',
  },
  {
    'arabic': 'الرَّشِيدُ',
    'turkish': 'Er-Reşîd',
    'meaning': 'Bütün işleri isabetli olan',
  },
  {
    'arabic': 'الصَّبُورُ',
    'turkish': 'Es-Sabûr',
    'meaning': 'Çok sabırlı olan',
  },
];
