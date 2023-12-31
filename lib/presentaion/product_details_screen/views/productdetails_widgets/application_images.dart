import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';
import 'package:photo_view/photo_view.dart';

class ApplicationImages extends StatelessWidget {
  ApplicationImages({super.key, this.imageList = const []});

  List<ApplicationproductImage>? imageList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 170,
          crossAxisSpacing: 10.0,
          childAspectRatio: .8),
      itemBuilder: (BuildContext context, int index) {
        print(imageList![index].imageUrl.toString());
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * .60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            imageList![index].imageUrl != null
                                ? PhotoView(
                                    backgroundDecoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    imageProvider: NetworkImage(imageList?[
                                                index]
                                            .imageUrl ??
                                        "https://www.ira-sme.net/wp-content/themes/consultix/images/no-image-found-360x260.png"),
                                  )
                                : SizedBox(),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        )));
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     imageList![index].imageUrl ??
                  //         "https://www.ira-sme.net/wp-content/themes/consultix/images/no-image-found-360x260.png", // need to be chanded
                  //   ),
                  //   fit: BoxFit.cover,
                  // )
                ),
                child: CommonImageView(
                  url: imageList![index].imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
        );
      },
      itemCount: imageList!.length,
    );
  }
}
