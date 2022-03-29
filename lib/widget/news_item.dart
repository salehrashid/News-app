import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.urlToImage,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            
            //title dari artikel
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleArticle.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10),

                //calendar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        SizedBox(
                          width: 80,
                          child: Text(
                            time(DateTime.parse(article.publishedAt)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: authorDateArticle.copyWith(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                   
                    //nama author                   
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        SizedBox(
                          width: 100,
                          child: Text(
                            article.author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: authorDateArticle.copyWith(fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  String time(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: 'id');
  }
}
