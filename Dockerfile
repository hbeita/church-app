FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install yarn -g


RUN apt-get remove --purge git -y \
  && apt-get autoremove -y \
  && apt-get autoclean

RUN apt-get update \
  && apt-get install -y \
    dh-autoreconf -y \
    libcurl4-openssl-dev \
    tcl-dev \
    gettext \
    asciidoc

# RUN curl -L --retry 5 "https://www.github.com$(curl 'https://github.com/git/git/tags' | grep -o "/git/git/archive/v2\..*\.tar\.gz" | sort -r | head -1 | tr -d '\n')" --output "git-source.tar.gz" \
#   && mkdir -p /tmp/git-source \
#   && tar -xf "git-source.tar.gz" --strip 1 -C /tmp/git-source/ \
#   && cd /tmp/git-source/ \
#   && make configure \
#   && ./configure --prefix=/usr --with-openssl \
#   && make \
#   && make install \
#   && cd - \
#   && rm -rf /tmp/git-source

# RUN rm -rf /tmp/git-source

# Done building Git

RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
