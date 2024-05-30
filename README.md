<p align="center" >
  <b>POINT UTAMA</b>
</p>

---

> #### INSTALASI
> - PHP 8.1.0
> - LARAVEL 10.2.4
>   ```
>   composer create-project laravel\laravel=v10.2.4 belajar-laravel-eloquent
>   ```
---
> #### CARA MENJALANKAN PROGRAM
> ```
> php artisan serve
> ```
---
> #### ELOQUENT
> - Eloquent dalam Laravel adalah ORM (Object-Relational Mapping) yang memungkinkan Anda berinteraksi dengan database menggunakan objek-objek PHP. Ini menyediakan cara intuitif dan ekspresif untuk membuat, membaca, memperbarui, dan menghapus data. Anda dapat mendefinisikan model-model Eloquent untuk merepresentasikan tabel-tabel dalam database Anda, mendefinisikan relasi antara model-model tersebut, dan mengeksekusi kueri untuk mengambil data dengan metode chaining yang mudah dipahami. Dengan fitur-fitur seperti mutator, accessor, dan event model, Eloquent membuat pengelolaan data dalam aplikasi Laravel menjadi lebih efisien dan nyaman.
---
> #### MODEL
> - Model dalam Laravel Eloquent adalah kelas PHP yang merepresentasikan tabel dalam database. Dengan model, Anda dapat melakukan berbagai operasi database seperti membuat, membaca, memperbarui, dan menghapus data.
> - Model memungkinkan Anda mendefinisikan relasi antar tabel, mengeksekusi kueri dengan mudah, dan menggunakan mutator dan accessor untuk manipulasi data. Anda juga dapat menanggapi peristiwa yang terjadi pada model dengan event model.
> - Keseluruhan, model dalam Eloquent menyediakan antarmuka yang kuat untuk berinteraksi dengan data dalam aplikasi Laravel.
---
> #### INSERT
> - Dalam konteks Laravel Eloquent, "insert" merujuk pada operasi untuk menyimpan data baru ke dalam database. Anda dapat menggunakan metode `create()` pada model Eloquent untuk melakukan operasi insert.
> - Contoh sederhana penggunaan `create()` adalah sebagai berikut:
> ```
> use App\Models\User;
>
> // Membuat dan menyimpan record baru dalam database
> $user = User::create([
>    'name' => 'Agung Sinaga',
>    'email' => 'agung@example.com',
>    'password' => bcrypt('password'),
> ]);
> ```
> - Dalam contoh di atas, `create()` akan membuat instance model baru dari kelas `User`, dan menyimpannya ke dalam tabel `users` dalam database. Array yang dilewatkan ke `create()` adalah data yang akan disimpan. Laravel akan secara otomatis mengatur kolom-kolom lain seperti `created_at` dan `updated_at` jika sudah didefinisikan dalam model Anda.
> - Metode `create()` memudahkan Anda untuk menyimpan data baru tanpa perlu menulis kueri SQL secara manual, karena Eloquent akan menangani pembuatan kueri insert untuk Anda di belakang layar.
---
> #### INSERT MANY
> - Insert many dalam Laravel Eloquent adalah operasi untuk menyimpan banyak baris data ke dalam database sekaligus. Anda dapat menggunakan metode `insert()` pada model Eloquent dan menyediakan array multidimensi yang berisi data yang akan dimasukkan. Setiap elemen dalam array luar mewakili satu baris data, dan setiap elemen dalam array dalam mewakili nilai kolom yang sesuai. Ini lebih efisien daripada menyisipkan satu per satu.
> - Berikut adalah contoh penggunaan `insert()` untuk insert many:
> ```
>  use App\Models\User;
>
> // Data yang akan dimasukkan
> $users = [
>    ['name' => 'Agung Sinaga', 'email' => 'agung@example.com', 'password' => bcrypt('password')],
>    ['name' => 'Vior Palik', 'email' => 'vior@example.com', 'password' => bcrypt('password')],
>    // Data lainnya
> ];
>
> // Melakukan insert many
> User::insert($users);
> ```
> - Dalam contoh di atas, kita memiliki sebuah array `$users` yang berisi data beberapa pengguna. Kemudian, kita menggunakan metode `insert()` pada model `User` untuk menyisipkan semua data sekaligus ke dalam tabel `users` dalam database.
> - Perlu diingat bahwa ketika menggunakan `insert()`, Eloquent tidak akan memicu event model atau menggunakan fitur seperti timestamps (`created_at` dan `updated_at`). Jadi pastikan data yang dimasukkan memenuhi persyaratan yang dibutuhkan. Juga, pastikan untuk memeriksa keamanan data, terutama jika data berasal dari input pengguna.
---
> #### FIND
> - Dalam Laravel Eloquent, "find" adalah metode yang digunakan untuk menemukan satu record dalam tabel database berdasarkan nilai kunci primernya (biasanya bernama "id"). Metode `find()` memungkinkan Anda untuk dengan cepat mengambil record dari database tanpa perlu menulis kueri SQL secara manual.
> - Contoh penggunaan `find()` adalah sebagai berikut:
> ```
> use App\Models\User;
>
> // Menemukan user dengan ID 1
> $user = User::find(1);
>
> // Menampilkan data user
> echo $user->name;
>```
> - Dalam contoh di atas, `User::find(1)` akan mencari record dengan kunci primer (id) 1 dalam tabel `users` dan mengembalikan model Eloquent yang mewakili record tersebut. Anda kemudian dapat mengakses kolom-kolom dalam record tersebut menggunakan properti pada model Eloquent.
> - Jika record dengan kunci primer yang diberikan tidak ditemukan, `find()` akan mengembalikan `null`. Jadi pastikan untuk memeriksa apakah record telah ditemukan sebelum mencoba mengaksesnya.
---
> #### UUID
> - UUID (Universally Unique Identifier) dalam Laravel Eloquent adalah jenis data untuk menyimpan identifikasi unik dalam database. Berbeda dengan kunci primer auto-increment, UUID adalah string global unik yang cocok untuk sistem terdistribusi dan melindungi privasi pengguna. Dalam Laravel, Anda dapat menggunakan UUID sebagai kunci primer dengan mendefinisikannya dalam skema tabel migrasi atau model Eloquent. Ini dapat dilakukan dengan mudah menggunakan paket eksternal seperti `ramsey/uuid.`
---
> #### TIMESTAMPS
> - Timestamps dalam konteks Laravel Eloquent merujuk pada dua kolom dalam tabel database, yaitu `created_at` dan `updated_at`, yang secara otomatis diatur dan diperbarui oleh Laravel. Ketika Anda menggunakan timestamps pada sebuah model, Laravel secara otomatis akan memperbarui nilai kolom `created_at` ketika record pertama kali dibuat, dan memperbarui nilai kolom `updated_at` setiap kali record tersebut diperbarui.
> - Fitur timestamps ini sangat berguna untuk melacak kapan record dibuat dan terakhir kali diperbarui dalam database. Ini juga memudahkan Anda dalam menerapkan logika terkait waktu, seperti menyortir berdasarkan waktu pembuatan atau pembaruan, atau menentukan apakah record telah diperbarui sejak waktu tertentu.
> - Secara default, Laravel mengasumsikan bahwa tabel yang memiliki kolom timestamps memiliki struktur seperti ini:
> - `created_at`: Kolom ini menunjukkan waktu ketika record pertama kali dibuat.
> - `updated_at`: Kolom ini menunjukkan waktu ketika record terakhir kali diperbarui.
> - Anda dapat mengaktifkan timestamps dengan menambahkan properti `$timestamps` ke dalam model Anda. Secara default, nilai properti ini disetel ke `true`, yang berarti Laravel akan menganggap model tersebut memiliki timestamps. Jika Anda tidak ingin menggunakan timestamps, Anda bisa menetapkan nilainya menjadi `false`.
> - Berikut adalah contoh penggunaan timestamps dalam model Eloquent:
> ```
> namespace App\Models;
>
> use Illuminate\Database\Eloquent\Model;
>
> class User extends Model
> {
>    /**
>     * Indicates if the model should be timestamped.
>     *
>     * @var bool
>     */
>    public $timestamps = true;
>}
> ```
> - Dengan menggunakan timestamps, Laravel secara otomatis akan mengelola nilai `created_at` dan `updated_at` ketika record dibuat atau diperbarui, membebaskan Anda dari pekerjaan manual dalam melacak waktu pembuatan dan pembaruan record.
---
> #### FILLABLE ATTRIBUTES 
> - Fillable attributes dalam Laravel Eloquent adalah atribut-atribut dalam model yang diizinkan untuk diisi secara massal. Ini membantu melindungi aplikasi dari serangan atribut masuk yang tidak diinginkan. Anda dapat menentukan atribut yang dapat diisi massal dengan mendefinisikan properti $fillable dalam model Anda. Dengan demikian, hanya atribut-atribut yang terdaftar dalam $fillable yang akan diperhatikan saat menyimpan data ke database.
---
> #### SOFT DELETE
> - Soft delete dalam Laravel adalah teknik untuk menghapus data secara "lunak", yang berarti data tetap ada dalam database tetapi ditandai sebagai "dihapus". Dengan menggunakan trait SoftDeletes, Laravel secara otomatis menangani proses soft delete untuk Anda. Data yang dihapus secara lunak dapat dipulihkan jika diperlukan.
---
> #### QUERY GLOBAL SCOPE
> - Query Global Scope dalam Laravel memungkinkan Anda menambahkan kriteria pencarian secara otomatis ke semua kueri yang dilakukan pada model tertentu.
> - Di sini adalah contoh penggunaannya dengan sintaks:
> ```
> namespace App\Scopes;
>
> use Illuminate\Database\Eloquent\Builder;
> use Illuminate\Database\Eloquent\Model;
> use Illuminate\Database\Eloquent\Scope;
>
> class ActiveScope implements Scope
> {
>    public function apply(Builder $builder, Model $model)
>    {
>        $builder->where('active', true);
>    }
> }
>```
> - Kemudian, mendaftarkan scope ke dalam model:
> ```
> namespace App\Models;
>
> use App\Scopes\ActiveScope;
> use Illuminate\Database\Eloquent\Model;
>
> class User extends Model
> {
>    protected static function boot()
>    {
>        parent::boot();
>
>        static::addGlobalScope(new ActiveScope());
>    }
> }
> ```
> - Dengan mendaftarkan Query Global Scope seperti ini, setiap kali kueri dilakukan pada model `User`, kondisi `where('active', true`) akan otomatis diterapkan, memastikan hanya record yang aktif yang akan dikembalikan.
---
> #### QUERY LOCAL SCOPE
> - Query Local Scope dalam Laravel memungkinkan Anda mendefinisikan metode khusus pada model untuk mengeksekusi kueri tertentu dengan kriteria pencarian yang sudah ditentukan.
> - Contoh sintaks sederhana adalah sebagai berikut:
> ```
> namespace App\Models;
>
> use Illuminate\Database\Eloquent\Model;
>
> class User extends Model
> {
>    /**
>     * Scope a query to only include active users.
>     *
>     * @param  \Illuminate\Database\Eloquent\Builder  $query
>     * @return \Illuminate\Database\Eloquent\Builder
>     */
>    public function scopeActive($query)
>    {
>        return $query->where('active', true);
>    }
> }
>```
> - Dalam contoh ini, kita mendefinisikan Query Local Scope bernama `scopeActive()`, yang menambahkan kondisi` where('active', true)` ke dalam kueri. Setelah mendefinisikan Query Local Scope, Anda bisa menggunakannya dalam kueri sebagai berikut:
> ```
> // Menggunakan Query Local Scope
> $activeUsers = User::active()->get();
> ```
> - Dengan menggunakan `scopeActive()`, kita dapat dengan mudah melakukan kueri untuk mengambil semua pengguna yang aktif tanpa perlu menuliskan kondisi `where('active', true)` secara manual setiap kali. Hal ini membuat kode lebih bersih dan lebih mudah dipelihara.
--- 
> #### ONE TO ONE
> - Dalam Laravel Eloquent, hubungan "One to One" adalah ketika setiap record dalam satu model berhubungan dengan satu record dalam model lainnya. Contohnya, setiap pengguna memiliki satu nomor telepon. Ini didefinisikan dengan `hasOne()` di model yang memiliki record terkait, dan `belongsTo(`) di model yang dimiliki.
> - Berikut adalah contoh sintaks untuk mendefinisikan dan menggunakan hubungan "One to One" dalam Laravel Eloquent:
> ```
> namespace App\Models;
>
> use Illuminate\Database\Eloquent\Model;
>
> class User extends Model
> {
>    /**
>     * Mendapatkan nomor telepon pengguna.
>     */
>    public function phone()
>    {
>        return $this->hasOne(Phone::class);
>    }
> }
>
> class Phone extends Model
> {
>   /**
>     * Mendapatkan pengguna yang memiliki nomor telepon ini.
>     */
>    public function user()
>    {
>        return $this->belongsTo(User::class);
>    }
> }
> ```
> - Dalam contoh ini, model `User` memiliki metode `phone()` yang mendefinisikan hubungan "One to One" menggunakan metode `hasOne()`. Di sisi lain, model Phone memiliki metode `user()` yang mendefinisikan hubungan "One to One" sebaliknya menggunakan metode `belongsTo()`.
> - Setelah mendefinisikan hubungan, Anda dapat mengakses record terkait seperti ini:
> ```
> // Mendapatkan nomor telepon pengguna dengan ID 1
> $user = User::find(1);
> $phone = $user->phone;
>
> // Mendapatkan pengguna yang memiliki nomor telepon dengan ID 1
> $phone = Phone::find(1);
> $user = $phone->user;
> ```
> - Dengan menggunakan hubungan "One to One" ini, Anda dapat dengan mudah mengakses dan memanipulasi data antara dua model yang berhubungan satu sama lain.
---
> #### ONE TO MANY
> - Dalam Laravel Eloquent, "one to many" adalah hubungan di mana satu entitas memiliki banyak entitas lainnya. Dalam kasus model `User` dan `Post`, satu pengguna dapat memiliki banyak pos. Ini ditentukan dengan metode `hasMany()` di model `User`.
> - Dalam Laravel, Anda dapat mendefinisikan hubungan ini di model Eloquent dengan menggunakan metode `hasMany()` pada model yang memiliki "banyak" entitas. Sebagai contoh:
> ```
> class User extends Model
> {
>     public function posts()
>     {
>         return $this->hasMany(Post::class);
>     }
> }
> ```
> - Dengan definisi ini, Anda dapat dengan mudah mengakses semua pos yang dimiliki oleh seorang pengguna melalui properti `posts` pada instance model `User`.
---
> #### QUERY BUILDER RELATIONSHIP
> - Dalam Laravel, Anda bisa menggunakan Query Builder untuk membuat relasi antara tabel dengan cara yang ringkas. Contohnya, untuk mengambil semua pos yang dimiliki oleh pengguna tertentu:
> ```
> $userId = 1;
>
> $posts = DB::table('posts')
>            ->where('user_id', $userId)
>            ->get();
>```
> - Dalam contoh ini, kita hanya melakukan filter pada tabel `posts` dengan kondisi bahwa `user_id` sama dengan ID pengguna yang diberikan.
---
> #### HAS ONE OF MANY
> - "Has One of Many" mungkin merujuk pada situasi di mana ada relasi di mana sebuah entitas memiliki satu baris dalam tabel lain, tetapi di sisi lain, baris tersebut juga dapat terhubung dengan banyak baris
dalam tabel tersebut. Contoh umumnya adalah ketika sebuah entitas memiliki satu item "utama" tetapi juga memiliki banyak item terkait.
> - Dalam konteks Laravel Eloquent, Anda dapat mencapainya dengan menggunakan metode `hasOne()` untuk menunjukkan relasi "Has One" dan kemudian menerapkan filter untuk menentukan item "utama" tersebut. Ini dapat dicapai dengan cara berikut:
> ```
> class User extends Model
> {
>    public function primaryItem()
>    {
>        return $this->hasOne(Item::class)->where('is_primary', true);
>    }
>
>    public function items()
>    {
>        return $this->hasMany(Item::class);
>    }
> }
>```
> - Dalam contoh ini, `primaryItem()` akan mengembalikan satu item yang dianggap "utama" untuk pengguna tertentu, sementara `items()` akan mengembalikan semua item yang dimiliki oleh pengguna tersebut.
---
> #### HAS ONE THROUGH
> - Dalam Laravel Eloquent, untuk menggunakan relasi "Has One Through" dengan lebih singkat, Anda dapat menggunakan metode `hasOneThrough()` di model `User`:
>```
> class User extends Model
> {
>    public function role()
>    {
>        return $this->hasOneThrough(Role::class, UserRole::class);
>    }
> }
>```
> - Dengan kode ini, Anda dapat dengan mudah mengakses peran tunggal yang dimiliki oleh seorang pengguna melalui relasi "Has One Through".
--- 
> #### HAS MANY THROUGH
> - Dalam Laravel Eloquent, Anda dapat menggunakan relasi "Has Many Through" dengan metode `hasManyThrough()` di model `Country`:
> ```
> class Country extends Model
> {
>    public function posts()
>    {
>        return $this->hasManyThrough(Post::class, User::class);
>    }
> }
>```
> - Dengan kode ini, Anda dapat dengan mudah mengakses semua pos yang terkait dengan negara tertentu melalui relasi "Has Many Through".
---
> #### MANY TO MANY
> - Dalam Laravel Eloquent, hubungan "Many to Many" dapat didefinisikan dengan cara yang singkat namun jelas. Misalnya, untuk model `User` dan `Role`, di mana seorang pengguna dapat memiliki banyak peran dan setiap peran dapat dimiliki oleh banyak pengguna:
> ```
> class User extends Model
> {
>    public function roles()
>    {
>        return $this->belongsToMany(Role::class);
>    }
> }
>
> class Role extends Model
> {
>    public function users()
>    {
>        return $this->belongsToMany(User::class);
>    }
> }
>```
> - Dalam contoh ini, model `User` memiliki metode `roles()` yang mengembalikan hubungan "Many to Many" dengan model `Role`, dan sebaliknya, model `Role` memiliki metode `users()` yang mengembalikan hubungan "Many to Many" dengan model `User`. Dengan definisi ini, Anda dapat dengan mudah mengakses peran yang dimiliki oleh pengguna dan pengguna yang memiliki suatu peran.
---
> #### INTERMEDIATE TABLE
> - Intermediate table dalam Laravel Eloquent adalah tabel yang digunakan untuk merepresentasikan hubungan many-to-many antara dua model. Ini diatur melalui metode `belongsToMany()` di kedua model yang terlibat, dengan menyediakan nama tabel intermediate dan kunci asing yang sesuai.
---
> #### PIVOT MODEL
> - Pivot model dalam Laravel adalah model khusus yang mewakili tabel intermediate dalam hubungan many-to-many antara dua model Eloquent. Ini otomatis dibuat saat Anda menggunakan metode `belongsToMany()`. Pivot model memungkinkan Anda menambahkan logika tambahan atau perilaku khusus terkait dengan hubungan many-to-many tersebut.
> - Contoh penggunaan pivot model dalam Laravel:
> ```
> use Illuminate\Database\Eloquent\Relations\Pivot;
>
> class UserRole extends Pivot {
>    // Tambahkan logika tambahan di sini jika diperlukan
> }
>```
> -  Dalam contoh di atas, `UserRole` adalah pivot model yang merepresentasikan tabel intermediate antara model User dan Role. Anda dapat menambahkan logika tambahan atau perilaku khusus ke dalam pivot model ini sesuai dengan kebutuhan aplikasi Anda.
---
> #### ONE TO ONE POLYMORPHIC
> - One-to-One Polymorphic dalam Laravel Eloquent memungkinkan sebuah model terhubung dengan beberapa model lain secara fleksibel tanpa perlu menambahkan banyak kolom kunci asing. Ini dicapai dengan menggunakan metode `morphOne()` di model yang memiliki hubungan dan `morphTo()` di model yang beragam.
---
> #### ONE TO MANY POLYMORPHIC
> - One-to-Many Polymorphic dalam Laravel Eloquent memungkinkan sebuah model terhubung dengan beberapa model lain secara fleksibel tanpa perlu menambahkan banyak kolom kunci asing. Ini dicapai dengan menggunakan metode `morphMany()` di model yang memiliki hubungan dan `morphTo()` di model yang beragam.
---
> #### MANY TO MANY POLYMORPHIC
> - Many-to-Many Polymorphic dalam Laravel Eloquent memungkinkan sebuah model terhubung dengan beberapa model lain secara fleksibel tanpa perlu menambahkan banyak tabel intermediate. Ini dicapai dengan menggunakan metode `morphToMany()` di model yang memiliki hubungan dan `morphedByMany()` di model yang beragam.
---
> #### POLYMORPHIC TYPE
> - Polymorphic Type adalah istilah yang digunakan dalam konteks hubungan polymorphic dalam Laravel Eloquent. Ini merujuk pada kolom di tabel database yang menyimpan jenis (type) dari entitas yang terlibat dalam hubungan polymorphic.
> - Dalam hubungan polymorphic, satu model dapat terhubung dengan beberapa model lain secara fleksibel. Untuk mengidentifikasi jenis entitas yang terlibat, Laravel menggunakan dua kolom: `morphable_id` yang menyimpan ID entitas terkait, dan `morphable_type` yang menyimpan jenis entitas tersebut.
> - Polymorphic type ini mencatat nama kelas (class) entitas yang terlibat dalam hubungan. Misalnya, jika entitas yang terlibat adalah "User", nilai dari kolom `morphable_type` akan menjadi "App\Models\User". Ini memungkinkan Laravel untuk mengetahui tipe entitas secara dinamis saat membangun kueri atau mengambil data dari database.
> - Dengan menggunakan polymorphic type, Laravel dapat menangani hubungan polymorphic secara transparan dan memudahkan penggunaan hubungan yang fleksibel antara model-model Eloquent dalam aplikasi.
---
> #### LAZY DAN EAGER LOADING
> - Lazy Loading adalah proses pengambilan data saat data tersebut benar-benar dibutuhkan. Eager Loading adalah proses pengambilan data yang dilakukan sebelum data tersebut diperlukan, biasanya dengan menggunakan metode `with()` pada kueri Eloquent.
---
> #### QUERYING RELATIONS
> - Querying Relations dalam Laravel Eloquent memungkinkan Anda untuk mengakses dan memanipulasi data yang terkait antara model-model dengan mudah. Anda dapat melakukan ini melalui metode relasi, metode querying langsung, dan menggunakan eager loading untuk mengoptimalkan kueri.
---
> #### AGGREGATING RELATIONS
> - Aggregating Relations dalam Laravel adalah proses menghitung nilai agregat (seperti jumlah, rata-rata, maksimum, minimum, dll.) dari data yang terkait antara model-model. Anda dapat menggunakan metode `withCount()` untuk menghitung jumlah relasi atau metode querying standar seperti `sum()`, `avg()`, `max()`, dan `min()` untuk menghitung nilai agregat dari data terkait.
---
> #### ACCESSOR dan MUTATOR
> - Accessor dalam Laravel Eloquent adalah metode yang digunakan untuk memanipulasi nilai atribut sebelum dikirimkan ke pengguna, sedangkan Mutator adalah metode yang digunakan untuk memanipulasi nilai atribut sebelum disimpan dalam basis data. Ini memungkinkan Anda untuk mengubah format atau menambahkan logika tambahan pada data sebelum atau sesudah disimpan.
> - 1. Accessor adalah metode dalam model Eloquent yang digunakan untuk memanipulasi nilai atribut sebelum dikirimkan ke pengguna. Dengan accessor, Anda dapat mengubah format atau menambahkan logika tambahan pada nilai atribut sebelum nilai tersebut dikembalikan ke pengguna. Misalnya, Anda dapat membuat accessor untuk mengubah format tanggal atau menghitung nilai berdasarkan atribut lain.
> - 2. Mutator adalah metode dalam model Eloquent yang digunakan untuk memanipulasi nilai atribut sebelum nilai tersebut disimpan dalam basis data. Dengan mutator, Anda dapat mengubah format atau menambahkan logika tambahan pada nilai atribut sebelum nilai tersebut disimpan. Misalnya, Anda dapat membuat mutator untuk mengubah format tanggal atau menghitung nilai berdasarkan atribut lain sebelum disimpan.
---
> #### ATTRIBUTE CASTING
> - Attribute Casting adalah fitur dalam Laravel Eloquent yang memungkinkan Anda untuk secara otomatis mengonversi tipe data atribut dalam model ketika membaca atau menulis ke basis data.
> - Dengan attribute casting, Anda dapat dengan mudah menentukan bahwa suatu atribut dalam model harus dianggap sebagai tipe data tertentu (seperti integer, boolean, array, JSON, dll.), dan Laravel akan secara otomatis melakukan konversi tersebut saat mengambil atau menyimpan data ke basis data.
> - Contoh:
> ```
> class User extends Model
> {
>    protected $casts = [
>        'is_admin' => 'boolean',
>        'settings' => 'array',
>        'dob' => 'date',
>    ];
> }
>```
> - Dalam contoh di atas, atribut `is_admin` akan dianggap sebagai boolean, `settings` akan dianggap sebagai array, dan `dob` akan dianggap sebagai tipe tanggal (date). Ketika Anda mengambil data dari basis data, Laravel akan secara otomatis mengonversi nilai-nilai atribut tersebut sesuai dengan tipe data yang ditentukan. Demikian pula, ketika Anda menyimpan data ke basis data, Laravel akan mengonversi nilai-nilai tersebut ke format yang sesuai untuk disimpan.
---
> #### CUSTOM CASTS
> - Custom Casts dalam Laravel Eloquent adalah fitur yang memungkinkan Anda membuat pengonversi tipe data kustom untuk mengonversi nilai atribut dalam model. Anda dapat membuat pengonversi sesuai kebutuhan dan mendaftarkannya dalam model menggunakan properti `$casts`.
---
> #### SERIALIZATION
> - Serialization adalah proses mengonversi objek atau struktur data menjadi format yang dapat disimpan atau ditransmisikan, seperti string atau byte stream, sehingga data tersebut dapat dipertahankan atau dipindahkan ke tempat lain dengan mudah. Ini memungkinkan data untuk disimpan dalam bentuk yang dapat dibaca dan diproses oleh berbagai platform atau sistem.
> - Dalam konteks pengembangan perangkat lunak, serialization sering digunakan untuk menyimpan objek dalam basis data, mentransmisikan data antara aplikasi yang berbeda, atau menyimpan konfigurasi aplikasi dalam berkas.
> - Laravel menyediakan dukungan yang kuat untuk serialization melalui fitur seperti Eloquent Serialization, yang memungkinkan Anda untuk dengan mudah mengonversi model Eloquent dan relasinya menjadi format yang dapat disimpan atau ditransmisikan, seperti JSON atau array asosiatif. Ini memudahkan dalam menyimpan dan memanipulasi data dalam aplikasi Laravel.
---
> #### FACTORY
> - Factory dalam konteks pengembangan perangkat lunak adalah mekanisme untuk membuat objek atau instance dari kelas dengan cara yang terstruktur dan terkontrol. Dalam framework Laravel, khususnya dalam Laravel's Database Testing dan Database Seeding, factory digunakan untuk membuat data dummy dalam basis data yang dapat digunakan untuk pengujian (testing) atau pengisian awal (seeding).
> - Factory di Laravel biasanya digunakan bersama dengan Faker PHP, yang digunakan untuk menghasilkan data dummy yang realistis secara acak. Dengan menggunakan factory, Anda dapat dengan mudah membuat banyak instance dari model dengan data yang bervariasi untuk pengujian atau pengisian awal basis data.
> - Contoh penggunaan factory dalam Laravel:
> ```
> use App\Models\User;
> use Illuminate\Database\Eloquent\Factories\Factory;
>
> class UserFactory extends Factory
> {
>    protected $model = User::class;
>
>    public function definition()
>    {
>        return [
>            'name' => $this->faker->name,
>            'email' => $this->faker->unique()->safeEmail,
>            'password' => bcrypt('password'),
>        ];
>    }
> }
>```
---
<p align="center" >
  <b>PERTANYAAN DAN CATATAN TAMBAHAN</b>
</p>

> - 

---

<p align="center" >
  <b>KESIMPULAN</b>
</p>

> - Laravel Eloquent adalah ORM (Object-Relational Mapping) yang intuitif dan kuat yang disediakan oleh framework Laravel, dirancang untuk mempermudah interaksi dengan database. Dengan menggunakan sintaks yang sederhana dan ekspresif, Eloquent memungkinkan pengembang untuk melakukan berbagai operasi database tanpa menulis query SQL secara langsung. Fitur-fitur seperti relasi antar tabel, pengelolaan model, serta fungsi bawaan untuk manipulasi data, menjadikan Eloquent alat yang sangat efisien dan produktif bagi pengembang dalam mengembangkan aplikasi web yang kompleks dan dinamis.
---

















 
