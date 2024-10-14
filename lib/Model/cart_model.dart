class CartItem {
  final String id;
  final String comments;
  final String certiNo;
  final String certificateUrl;
  final String certified;
  final String city;
  final String clarity;
  final String color;
  final String cut;
  final String depth;
  final String fluorescene;
  final String imageUrl;
  final String mesurement;
  final String polish;
  final String shape;
  final String size;
  final String sizeRange;
  final String status;
  final String stoneID;
  final String symm;
  final String table;
  final String type;
  final String videoUrl;

  CartItem({
    required this.id,
    required this.comments,
    required this.certiNo,
    required this.certificateUrl,
    required this.certified,
    required this.city,
    required this.clarity,
    required this.color,
    required this.cut,
    required this.depth,
    required this.fluorescene,
    required this.imageUrl,
    required this.mesurement,
    required this.polish,
    required this.shape,
    required this.size,
    required this.sizeRange,
    required this.status,
    required this.stoneID,
    required this.symm,
    required this.table,
    required this.type,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comments': comments,
      'certiNo': certiNo,
      'certificateUrl': certificateUrl,
      'certified': certified,
      'city': city,
      'clarity': clarity,
      'color': color,
      'cut': cut,
      'depth': depth,
      'fluorescene': fluorescene,
      'imageUrl': imageUrl,
      'mesurement': mesurement,
      'polish': polish,
      'shape': shape,
      'size': size,
      'sizeRange': sizeRange,
      'status': status,
      'stoneID': stoneID,
      'symm': symm,
      'table': table,
      'type': type,
      'videoUrl': videoUrl,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
        id: map['id'],
        certiNo: map['certiNo'],
        certificateUrl: map['certificate_url'],
        certified: map['certified'],
        city: map['city'],
        clarity: map['clarity'],
        color: map['color'],
        cut: map['cut'],
        comments: map['Comments'],
        depth: map['depth'],
        fluorescene: map['fluorescene'],
        imageUrl: map['image_url'],
        mesurement: map['mesurement'],
        polish: map['polish'],
        shape: map['shape'],
        size: map['size'],
        sizeRange: map['sizeRange'],
        stoneID: map['stone_ID'],
        symm: map['symm'],
        table: map['table'],
        type: map['type'],
        videoUrl: map['video_url'],
        status: map['status']);
  }
}
