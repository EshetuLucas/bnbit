// import 'package:amakari_app/data_model/posts/post.dart';
// import 'package:amakari_app/ui/ui_helpers/app_colors.dart';
// import 'package:amakari_app/ui/ui_helpers/shared_styles.dart';
// import 'package:amakari_app/ui/ui_helpers/ui_helpers.dart';
// import 'package:amakari_app/ui/widgets/placeholder_image.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:stacked/stacked.dart';

// import 'image_builder.dart';

// class PostsWidget extends StatelessWidget {
//   const PostsWidget({
//     Key? key,
//     required this.isBusy,
//     required this.posts,
//     this.isScrollable = false,
//     this.verticalPadding = 0,
//     this.onReadMore,
//   }) : super(key: key);
//   final bool isBusy;
//   final List<Post> posts;
//   final bool isScrollable;
//   final double verticalPadding;
//   final Function(Post, int)? onReadMore;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: EdgeInsets.symmetric(vertical: verticalPadding),
//       shrinkWrap: true,
//       physics: !isScrollable ? NeverScrollableScrollPhysics() : null,
//       itemCount: isBusy ? 10 : posts.length,
//       separatorBuilder: (BuildContext context, int index) {
//         return Column(
//           children: [
//             verticalSpaceMedium,
//             Divider(
//               color: Theme.of(context).colorScheme. tertiaryContainer,
//             ),
//             verticalSpaceMedium,
//           ],
//         );
//       },
//       itemBuilder: (BuildContext context, int index) {
//         final post = isBusy ? Post(id: 2) : posts[index];
//         final title = isBusy
//             ? 'Loading the tilte of this post'
//             : post.title?.rendered ?? '';
//         final content = isBusy
//             ? 'ቢያንስ በሳምንት አንድ ጊዜ ጤናማ ወሲብ የሚፈፀሙ ሰዎች በጭንቀትና በድብርት የመጠቃት ዕድላቸውን ይቀንሳል።\n ይህም በጭንቀት ሳቢያ ከሚመጡ በርካታ ህመሞች ይከላከላል።\nቢያንስ በሳምንት አንድ ጊዜ ጤናማ ወሲብ የሚፈፀሙ ሰዎች በጭንቀትና በድብርት የመጠቃት ዕድላቸውን ይቀንሳል።\n ይህም በጭንቀት ሳቢያ ከሚመጡ በርካታ ህመሞች ይከላከላል።'
//             : post.content?.rendered ?? '';
//         return Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 10,
//             vertical: 2,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (post.media != null)
//                 SizedBox(
//                   height: 222,
//                   child: Card(
//                     elevation: 5,
//                     shadowColor: Theme.of(context).colorScheme. secondary.withOpacity(0.99),
//                     margin: EdgeInsets.zero,
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     child: PlaceholderImage(
//                       imageUrl: post.media?.guid?.rendered ??
//                           'assets/images/icon.png',
//                       fit: BoxFit.cover,
//                       cornerRadius: 0,
//                       showGreyBackground: false,
//                       placeHolder: Container(
//                         alignment: Alignment.center,
//                         color: Theme.of(context).colorScheme. primary,
//                         child: Shimmer.fromColors(
//                           baseColor: Theme.of(context).colorScheme. primary,
//                           highlightColor: Theme.of(context).colorScheme. onBackground,
//                           child: ImageBuilder(
//                               fit: BoxFit.cover,
//                               imagePath: 'assets/images/icon.png'),
//                           enabled: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               else
//                 SizedBox(
//                   height: 200,
//                   child: SkeletonLoader(
//                     startColor: kcLightWhite,
//                     endColor: Theme.of(context).colorScheme. tertiaryContainer5,
//                     loading: isBusy,
//                     child: Card(
//                         margin: EdgeInsets.zero,
//                         clipBehavior: Clip.antiAlias,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           color: Theme.of(context).colorScheme. primary,
//                           child: Shimmer.fromColors(
//                             baseColor: Theme.of(context).colorScheme. primary,
//                             highlightColor: Theme.of(context).colorScheme. onBackground,
//                             child: ImageBuilder(
//                                 fit: BoxFit.cover,
//                                 imagePath: 'assets/images/icon.png'),
//                             enabled: true,
//                           ),
//                         )),
//                   ),
//                 ),
//               verticalSpaceSmall,
//               SkeletonLoader(
//                 startColor: kcLightWhite,
//                 endColor: Theme.of(context).colorScheme. tertiaryContainer5,
//                 loading: isBusy,
//                 child: Text(
//                   title,
//                   style: ktsBoldTextStyle.copyWith(
//                       color: Theme.of(context).colorScheme. primary, fontSize: 17),
//                 ),
//               ),
//               verticalSpaceSmall,
//               SkeletonLoader(
//                 startColor: kcLightWhite,
//                 endColor: Theme.of(context).colorScheme. tertiaryContainer5,
//                 loading: isBusy,
//                 child: RichText(
//                   text: TextSpan(
//                       text: content.length > 250 && post.readMore
//                           ? '${content.substring(0, 200)}'
//                           : content,
//                       style: ktsSmallDarkTextStyle,
//                       children: [
//                         if (content.length > 250)
//                           TextSpan(
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () => onReadMore!(post, index),
//                             text: ' ...Read ' +
//                                 '${post.readMore ? 'More' : 'Less'}',
//                             style: ktsBoldMeidumDarkTextStyle.copyWith(
//                                 color: Theme.of(context).colorScheme. secondary, fontSize: 14.5),
//                           ),
//                       ]),
//                   textAlign: TextAlign.left,
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
