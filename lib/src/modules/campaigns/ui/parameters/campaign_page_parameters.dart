import 'package:equatable/equatable.dart';

class CampaignPageParameters extends Equatable {
  final String title;
  final String description;
  final String? link;
  final String? bannerUrl;

  const CampaignPageParameters({
    required this.title,
    required this.description,
    this.link,
    this.bannerUrl,
  });

  factory CampaignPageParameters.fromQueryParameters(
    Map<String, String> query,
  ) {
    return CampaignPageParameters(
      title: query['title']!,
      description: query['description']!,
      link: query['link'],
      bannerUrl: query['banner_url'],
    );
  }

  String toQueryParameters() {
    var queryParameters = '?title=$title&description=$description';

    if (link != null) {
      queryParameters += '&link=$link';
    }

    if (bannerUrl != null) {
      queryParameters += '&banner_url=$bannerUrl';
    }

    return queryParameters;
  }

  @override
  List<Object?> get props => [
        title,
        description,
        link,
        bannerUrl,
      ];
}
