package com.junctionx.pandalion.sms.dto.request;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessagesRequestDto {

    @NotBlank
    private String to;

    @NotBlank
    private String content;

}
