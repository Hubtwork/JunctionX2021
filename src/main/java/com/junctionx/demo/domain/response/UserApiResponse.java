package com.junctionx.demo.domain.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserApiResponse {
    private Long userId;

    private String name;

    private String groupName;

    private int channelNumber;

    private String code;

    private String location;
}
