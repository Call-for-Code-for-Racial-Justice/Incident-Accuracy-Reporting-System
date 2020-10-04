---
# Related publishing issue: https://github.ibm.com/IBMCode/Code-Tutorials/issues/4710
draft: 		#Required=true (true|false) - If false, the content is published. If true, the content is in draft state on our staging server.
ignore_prod: 		#Required=false (true|false) - If true, the changes to the content do not show on the live site. If false, the changes are published to the live site.
display_in_listing: 		#Required=false (true|false) - If set to true (the default value), nothing happens. If set to false, the page will exist but it won't be displayed in hubs, archives, or search. Set this to false when you use the page_links_to metadata.
title: 		#Required=true - Title of the content. In general, use task-oriented phrases. Use fewer than 55 characters, including spaces. Front-load with SEO keywords. Include product and service names here, if length allows.
subtitle: 		#Required=true - Subtitle of the content. Use fewer than 140 characters, including spaces. Make it tweetable. Include product and service names here. For component hub pages, this should be a short phrase that defines the component.
meta_title: 		#Required=false - This is the title used for SEO purposes. Front-load with SEO keywords. If none is specified, the title is used.
authors: 		#Required=false - List the authors who contributed to writing the content. The author listed first is the primary author, who is responsible for maintaining the content. If no authors are specified, the author defaults to "IBM Developer Staff".
  - name: 		#Required=true
    email: 		#Required=true
  - name: 		#Required=true
    email: 		#Required=true

completed_date: 		#Required=true - This date is when the content was originally published. The date format is YYYY-MM-DD.
last_updated: 		#Required=false - This date is when the content was significantly updated. The date format is YYYY-MM-DD.
archive_date: 		#Required=false - This date is when the content was archived. The date format is YYYY-MM-DD.
check_date: 		#Required=false - This date is when in the future the content should be re-checked. The date format is YYYY-MM-DD
time_to_read: 		#Required=false - Specify the amount of time (in minutes or hours) it takes to read or use the content.
excerpt: 		#Required=true - 1-2 short sentences (fewer than 155 characters including spaces) that summarize the content. Can duplicate the subtitle, or expand upon the subtitle. Start with a strong verb, give a glimpse of what the reader can do, show what the reader will get out of the content.
meta_description: 		#Required=false - This is a description used for SEO purposes. Use fewer than 155 characters, including spaces. Front-load with SEO keywords. Start with a strong verb, give a glimpse of what the reader can do, show what the reader will get out of the content.
meta_keywords: 		#Required=false - This is a set of keywords used for SEO purposes. Specify a comma separated list of keywords. Choose keywords that answer questions that readers are asking. Specify 3-5 keywords.
primary_tag: 		#Required=true - Select the 1 tag that represents the primary focus for the content. You can specify additional tags on the "tags:" element. (Primary tags can only be the slugs from either the https://github.ibm.com/IBMCode/Definitions/blob/master/tags.yml file or the https://github.ibm.com/IBMCode/Definitions/blob/master/components.yml file.)
tags: 		#Required=false - Select the 1 or more tags that represent what the content is about. Do not duplicate what you specify for the "primary_tag:". Less is more. (Tags can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/tags.yml file.)
components: 		#Required=false - Select the 1 or more components that represent what the content is about. Do not duplicate what you specify for the "primary_tag:". Less is more. (Components can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/components.yml file.)
services: 		#Required=false - Select the 1 or more services that are specifically in use by the content. Less is more. (Services can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/services.yml file.) 
runtimes: 		#Required=false - Select the 1 or more runtimes that are specifically in use by the content. Less is more. (Runtimes can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/runtimes.yml file.)
related_content: 		#Required=false - Specify 1 to 6 pieces of closely related content.
  - type: 		#Required=true announcements|articles|blogs|collections|events|models|patterns|podcast_episodes|podcasts|series|tutorials|videos|link_cards|conferences
    slug: 		#Required=true
  - type: 		#Required=true announcements|articles|blogs|collections|events|models|patterns|podcast_episodes|podcasts|series|tutorials|videos|link_cards|conferences
    slug: 		#Required=true

related_links: 		#Required=false - Specify 1 or more links to external content (that does not appear on IBM Developer). The description does not display of the link does NOT display on the page.
  - title: 		#Required=true
    url: 		#Required=true
    description: 		#Required=false
  - title: 		#Required=true
    url: 		#Required=true
    description: 		#Required=false

cities: 		#Required=false - Optionally, select 1 or more cities where the content is used. (Cities can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/cities.yml file.)
collections: 		#Required=false - Select the 1 or more collections that you want the content to appear in. (Collections can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/collections.yml file.)
meta_tags: 		#Required=false - Ignore this. Do not use this. This is a comma separated list of tags used for SEO purposes. Only our SEO person will add these tags.
social_media_meta: 		#Required=false - This is a description that goes in the social media description. Duplicate the meta_description.
private_portals: 		#Required=false - Will this content be served directly to a private portal?
content_tags: 		#Required=false - This is used to feature content on collections pages or on the community page. Only the editors of collections pages or the community page should use this metadata. Full list at https://github.ibm.com/IBMCode/Definitions/blob/master/content_tags.yml
page_links_to: 		#Required=false - Provide a full URL of a piece of content or a page that you want this content to redirect to. If you specify a URL here, this content will not be displayed.
---
## Markdown goes here and below

Add your intro here.

## Learning objectives

Explain what the user will learn.

## Prerequisites

List pre-reqs here.

## Estimated time

Completing this tutorial should take about 30 minutes.

## Steps

### Title for your step

Add detailed steps.

## Summary

Add call to actions.