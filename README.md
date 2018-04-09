# Fritzbox::Smarthome - WebApp

This WebApp uses the [fritzbox-smarthome](https://github.com/klausmeyer/fritzbox-smarthome) ruby gem to interface with the Smarthome Features of a FritzBox.

## Usage

Check `config/initializers/fritzbox-smarthome.rb` for required configuration.

### With local Ruby installation

* Run those commands:
  * `gem install bundler`
  * `bundle install`
  * `rails server`
* Access on `http://localhost:3000`

### With Docker

* Use the official docker image:

  ```
  docker run -it --rm \
    -p 3000:8080 \
    -e FRITZBOX_ENDPOINT=https://fritz.box \
    -e FRITZBOX_USERNAME=john \
    -e FRITZBOX_PASSWORD=doe \
    -e VERIFY_SSL=false \
    klausmeyer/fritzbox-smarthome-webapp
  ```
