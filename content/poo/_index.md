+++
title = "Programación Orientada a Objetos"
outputs = ["Reveal"]
description = "Introducción a la materia de Programación Orientada a Objetos"
transition = "slide"
transition_speed = "fast"
+++
{{< slide id="c-w" >}}
### Bienvenidos a Programación Orientada a Objetos

{{< highlight java "" >}}
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Random;
import org.json.JSONObject;

public class RandomPokemon {

    public static void main(String[] args) {
        try {
            // Initialize HTTP Client
            HttpClient client = HttpClient.newHttpClient();

            // Generate a random Pokémon ID between 1 and 898 (number of Pokémon in the first 8 generations)
            int randomPokemonId = new Random().nextInt(898) + 1;

            // Create a request to the PokeAPI
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://pokeapi.co/api/v2/pokemon/" + randomPokemonId))
                    .build();

            // Send the request and get the response
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // Parse the response to JSON
            JSONObject jsonObject = new JSONObject(response.body());

            // Get the Pokémon name
            String pokemonName = jsonObject.getString("name");

            // Print the Pokémon name
            System.out.println("Random Pokémon: " + pokemonName);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

{{< /highlight >}}


[Atajo a planificación semanal](#weekly-content)

---

{{< slide content="slides.welcome" >}}

---
{{< slide id="weekly-content" >}}
### Links

- [Volver a la bienvenida](#c-w)
- [Semana 1]({{< ref "/poo/w1/_index.md" >}})
- [Semana 2]({{< ref "/poo/w2/_index.md" >}})
- [Semana 3]({{< ref "/poo/w3/_index.md" >}})
- [Semana 4]({{< ref "/poo/w4/_index.md" >}})
