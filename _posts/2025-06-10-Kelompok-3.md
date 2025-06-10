---
title: "Huffman Coding Algorithm"
date: 2025-06-10 00:00:00 +0800
categories: [desain dan analisis algoritma, Huffman Coding]
tags: [belajar]
description: Penjelasan lengkap tentang Huffman Coding dan bagaimana algoritma ini bekerja
---

# Huffman Coding: Kompresi Data Optimal dengan Algoritma Greedy

## 📌 Pendahuluan  
Huffman Coding adalah algoritma kompresi data *lossless* yang ditemukan oleh David A. Huffman pada tahun 1952. Algoritma ini bekerja dengan mengganti karakter yang sering muncul dengan kode biner lebih pendek, dan karakter yang jarang dengan kode lebih panjang.  

Contoh Aplikasi Dunia Nyata:  
✔ Kompresi file (ZIP, RAR)  
✔ Format media (JPEG, MP3)  
✔ Transmisi data elektronik  

---

## 🎯 Definisi Masalah  
Diberikan:  
- Sekumpulan karakter dan frekuensi kemunculannya  
- Tujuan:  
  ➡ Menyusun kode biner untuk setiap karakter sehingga:  
  - Panjang total pesan setelah kompresi menjadi minimum  
  - Kode bersifat *prefix-free* (tidak ada kode yang menjadi awalan dari kode lainnya)

---

## ⚡ Konsep dan Strategi Huffman Coding  
Strategi algoritma Huffman:  
1. Hitung frekuensi tiap karakter.  
2. Buat *node* untuk setiap karakter.  
3. Gabungkan dua *node* dengan frekuensi terkecil.  
4. Ulangi hingga terbentuk satu pohon Huffman.  
5. Tetapkan kode biner: kiri = 0, kanan = 1.  

### 📝 Pseudocode  
```plaintext
1. Masukkan semua karakter ke dalam min-heap berdasarkan frekuensi
2. Selama ukuran heap > 1:
   - Ambil dua node dengan frekuensi terkecil
   - Gabungkan keduanya menjadi node baru dengan jumlah frekuensi
   - Masukkan node baru ke heap
3. Bangun pohon Huffman dari node akhir
4. Lakukan traversal untuk menetapkan kode biner tiap karakter
````

---

## **💻 Implementasi C++ (Sederhana)**

```cpp
#include <iostream>
#include <queue>
#include <unordered_map>
using namespace std;

struct Node {
    char ch;
    int freq;
    Node *left, *right;
};

struct Compare {
    bool operator()(Node* l, Node* r) {
        return l->freq > r->freq;
    }
};

void printCodes(Node* root, string str) {
    if (!root) return;
    if (root->ch != '#') 
        cout << root->ch << ": " << str << "\n";
    printCodes(root->left, str + "0");
    printCodes(root->right, str + "1");
}

int main() {
    unordered_map<char, int> freq = {
        {'A', 1}, {'B', 2}, {'C', 3}, {'D', 4}
    };
    
    priority_queue<Node*, vector<Node*>, Compare> pq;
    
    for (auto pair : freq) {
        Node* node = new Node{pair.first, pair.second, nullptr, nullptr};
        pq.push(node);
    }

    while (pq.size() > 1) {
        Node* left = pq.top(); pq.pop();
        Node* right = pq.top(); pq.pop();
        Node* merged = new Node{'#', left->freq + right->freq, left, right};
        pq.push(merged);
    }

    cout << "🟢 Kode Huffman untuk masing-masing karakter:\n";
    printCodes(pq.top(), "");
    return 0;
}
```

### 📊 Output Contoh

```
🟢 Kode Huffman untuk masing-masing karakter:
D: 0
C: 10
B: 110
A: 111
```

---

## 🔬 Simulasi Kompresi

String: “ABBCCCDDDD”

* Total karakter: 10
* Ukuran asli (ASCII): 8 bit × 10 = 80 bit
* Ukuran setelah Huffman Coding: 45 bit
  ➡ Penghematan ruang sebesar 43.75%

---

## 🔍 Analisis Kompleksitas

| Kriteria          | Kompleksitas   |
| ----------------- | -------------- |
| Pembuatan heap    | O(n log n)     |
| Pembangunan pohon | O(n log n)     |
| Penetapan kode    | O(n)           |
| **Total**         | **O(n log n)** |

---

## ✅ Kelebihan & ❌ Kekurangan

| Kelebihan                                            | Kekurangan                                       |
| ---------------------------------------------------- | ------------------------------------------------ |
| ✅ *Lossless*, tidak ada data yang hilang             | ❌ Tidak efisien jika distribusi frekuensi merata |
| ✅ Efisien untuk data dengan distribusi berat sebelah | ❌ Memerlukan tabel kode untuk dekompresi         |
| ✅ Banyak digunakan di sistem kompresi modern         |                                                  |

---

## 📌 Kesimpulan

✅ Huffman Coding adalah metode kompresi *lossless* berbasis frekuensi karakter
✅ Dengan pohon biner dan pendekatan greedy, solusi optimal dapat dicapai
✅ Efektif dalam mengurangi ukuran data jika distribusi karakter tidak merata

---


