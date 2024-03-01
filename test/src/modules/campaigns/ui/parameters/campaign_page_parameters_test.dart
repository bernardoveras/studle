import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/campaigns/ui/parameters/campaign_page_parameters.dart';

void main() {
  test('CampaignPageParameters - equality', () {
    const parameter1 = CampaignPageParameters(
      title: 'Title',
      description: 'Description',
      link: 'https://google.com',
      bannerUrl: 'https://banner.com',
    );

    const parameter2 = CampaignPageParameters(
      title: 'Title',
      description: 'Description',
      link: 'https://google.com',
      bannerUrl: 'https://banner.com',
    );

    expect(parameter1, parameter2);
  });

  group('CampaignPageParameters - fromQueryParameters', () {
    test('all', () {
      final parameter = CampaignPageParameters.fromQueryParameters(const {
        'title': 'Title',
        'description': 'Description',
        'link': 'https://google.com',
        'banner_url': 'https://banner.com',
      });

      expect(parameter.title, 'Title');
      expect(parameter.description, 'Description');
      expect(parameter.link, 'https://google.com');
      expect(parameter.bannerUrl, 'https://banner.com');
    });

    test('without link', () {
      final parameter = CampaignPageParameters.fromQueryParameters(const {
        'title': 'Title',
        'description': 'Description',
        'banner_url': 'https://banner.com',
      });

      expect(parameter.title, 'Title');
      expect(parameter.description, 'Description');
      expect(parameter.bannerUrl, 'https://banner.com');
      expect(parameter.link, null);
    });

    test('without banner', () {
      final parameter = CampaignPageParameters.fromQueryParameters(const {
        'title': 'Title',
        'description': 'Description',
        'link': 'https://google.com',
      });

      expect(parameter.title, 'Title');
      expect(parameter.description, 'Description');
      expect(parameter.link, 'https://google.com');
      expect(parameter.bannerUrl, null);
    });

    test('without link and banner', () {
      final parameter = CampaignPageParameters.fromQueryParameters(const {
        'title': 'Title',
        'description': 'Description',
      });

      expect(parameter.title, 'Title');
      expect(parameter.description, 'Description');
      expect(parameter.link, null);
      expect(parameter.bannerUrl, null);
    });
  });

  group('CampaignPageParameters - toQueryParameters', () {
    test('all', () {
      const parameter = CampaignPageParameters(
        title: 'Title',
        description: 'Description',
        link: 'https://google.com',
        bannerUrl: 'https://banner.com',
      );

      final queryParameter = parameter.toQueryParameters();

      expect(
        queryParameter.contains('title=${parameter.title}'),
        true,
      );

      expect(
        queryParameter.contains('description=${parameter.description}'),
        true,
      );

      expect(
        queryParameter.contains('link=${parameter.link}'),
        true,
      );

      expect(
        queryParameter.contains('banner_url=${parameter.bannerUrl}'),
        true,
      );
    });

    test('without link', () {
      const parameter = CampaignPageParameters(
        title: 'Title',
        description: 'Description',
        bannerUrl: 'https://banner.com',
      );

      final queryParameter = parameter.toQueryParameters();

      expect(
        queryParameter.contains('title=${parameter.title}'),
        true,
      );

      expect(
        queryParameter.contains('description=${parameter.description}'),
        true,
      );

      expect(
        queryParameter.contains('link=${parameter.link}'),
        false,
      );

      expect(
        queryParameter.contains('banner_url=${parameter.bannerUrl}'),
        true,
      );
    });

    test('without banner', () {
      const parameter = CampaignPageParameters(
        title: 'Title',
        description: 'Description',
        link: 'https://google.com',
      );

      final queryParameter = parameter.toQueryParameters();

      expect(
        queryParameter.contains('title=${parameter.title}'),
        true,
      );

      expect(
        queryParameter.contains('description=${parameter.description}'),
        true,
      );

      expect(
        queryParameter.contains('link=${parameter.link}'),
        true,
      );

      expect(
        queryParameter.contains('banner_url=${parameter.bannerUrl}'),
        false,
      );
    });

    test('without link and banner', () {
      const parameter = CampaignPageParameters(
        title: 'Title',
        description: 'Description',
      );

      final queryParameter = parameter.toQueryParameters();

      expect(
        queryParameter.contains('title=${parameter.title}'),
        true,
      );

      expect(
        queryParameter.contains('description=${parameter.description}'),
        true,
      );

      expect(
        queryParameter.contains('link=${parameter.link}'),
        false,
      );

      expect(
        queryParameter.contains('banner_url=${parameter.bannerUrl}'),
        false,
      );
    });
  });
}
