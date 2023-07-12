class ArticlesRepresenter
    def initialize(articles)
        @articles = articles
    end

    def as_json
        articles.map do |article|
            {
                id: article.id,
                title: article.title,
                author_info: {
                    author_full_name: author_name(article),
                    author_age: article.author.age,
                },
                category: article.channel.name,

            # id: article.id,
            # title: article.title,
            # author_name: author_name(article),
            # author_age: article.author.age,
            # category: article.channel.name,
            }
        end
    end

    private
    attr_reader :articles

    def author_name(article)
        "#{article.author.first_name} #{article.author.last_name}"
    end
end