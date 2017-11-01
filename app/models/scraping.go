package models

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
)

type Topic struct {
	Text string
	Href string
}

func Scraping() (string, []Topic) {

	doc, err := goquery.NewDocument("https://www.infoseek.co.jp/")
	if err != nil {
		fmt.Println(err)
	}

	// ページtitleの取得
	title := doc.Find("title").Text()

	var topics []Topic
	// トピックを取得
	doc.Find("div#allBlock ul.topNewslist li").Each(func(i int, s *goquery.Selection) {
		aTag := s.Find("a")
		href, _ := aTag.Last().Attr("href")
		var topic Topic
		topic.Text = aTag.Text()
		topic.Href = href
		topics = append(topics, topic)
	})
	return title, topics
}
