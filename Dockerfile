FROM ruby:3.3.5-slim

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    JEKYLL_ENV=development \
    EXECJS_RUNTIME=Node

RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      libyaml-dev \
      nodejs \
      pkg-config \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll
COPY Gemfile* ./
RUN gem install --no-document bundler && bundle install
COPY . .

EXPOSE 8080 35729
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "8080", "--livereload", "--force_polling"]
