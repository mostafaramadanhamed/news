import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';

import '../screens/web_view.dart';

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => const Divider(),
    itemCount:list.length,
  ),
  fallback: (context) =>
  isSearch ? Container() : const Center(child: CircularProgressIndicator()),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>WebViewScreen(article[MyStrings.articleUrl]),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        if(article[MyStrings.articleUrlImage] !=null)  Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: FadeInImage(
              placeholder: placeholder,
              image:  NetworkImage('${article[MyStrings.articleUrlImage]}')),
        ),
        if(article[MyStrings.articleUrlImage] ==null)  Container(
          width:MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            image:const DecorationImage(
              image: AssetImage('assets/images/nullimage.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article[MyStrings.articleTitle]}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            if(article[MyStrings.articleSource] !=null)
              Text(
                  '${article[MyStrings.articleSource][MyStrings.articleSourceName]}',
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
          Text(
            article[MyStrings.articleTime].toString().substring(0,10),
            style: const TextStyle(
              color: Colors.grey,
            ),),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
      ],
    ),
  ),
);
